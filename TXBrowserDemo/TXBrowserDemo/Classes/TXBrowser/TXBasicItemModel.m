//
//  TXBasicItemModel.m
//  TXBrowser
//
//  Created by tingxins on 3/12/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import "TXBasicItemModel.h"
#import <objc/runtime.h>

@implementation TXBasicItemModel

- (instancetype)initBasicItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle operation:(TXBasicItemOperation)operation {
    if (self = [super init]) {
        self.basicClassType = basicClassType;
        self.basicItemTitle = basicItemTitle;
        self.operation = operation;
    }
    return self;
}

+ (instancetype)basicItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle operation:(TXBasicItemOperation)operation {
    return [[self alloc] initBasicItemModelWithClassType:basicClassType title:basicItemTitle operation:operation];
}

#pragma mark - Runtime

- (void)configs:(id)target withBlock:(TXBasicItemBlock)block {
    objc_setAssociatedObject(self, (__bridge const void *)(target), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TXBasicItemBlock)executeWithTarget:(id)target {
    id objc = objc_getAssociatedObject(self, (__bridge const void *)target);
    if ([objc isKindOfClass:NSClassFromString(@"__NSGlobalBlock__")] ||
        [objc isKindOfClass:NSClassFromString(@"__NSMallocBlock__")]) {
        return (TXBasicItemBlock)objc;
    }
    return nil;
}

- (void)configs:(id)target response:(id)response withSEL:(SEL)sel {
    Class cls = object_getClass(response);
    Method method = class_getInstanceMethod(cls, sel);
    if (!method) {
        @throw [NSException exceptionWithName:@"fatal error." reason:[NSString stringWithFormat:@"unrecognized method: ***%@***-[%@]",NSStringFromClass(cls), NSStringFromSelector(sel)] userInfo:@{@"methodName":NSStringFromSelector(sel)}];
        return;
    }
    // sel Associated
    objc_setAssociatedObject(self, (__bridge const void *)(target), NSStringFromSelector(sel), OBJC_ASSOCIATION_COPY_NONATOMIC);
    // response Associated
    objc_setAssociatedObject(self, sel, response, OBJC_ASSOCIATION_ASSIGN);
}

- (SEL)executeSELWithTarget:(id)target {
    // 取 target 对象绑定的 SEL
    SEL sel = NSSelectorFromString((NSString *)objc_getAssociatedObject(self, (__bridge const void *)(target)));
    if (!sel) return NULL;
    // 取 sel 绑定的 response
    id response = objc_getAssociatedObject(self, sel);
    
    HiddenPerformSelectorLeakWarning([response performSelector:sel withObject:target];);
    
    return sel;
}

@end
