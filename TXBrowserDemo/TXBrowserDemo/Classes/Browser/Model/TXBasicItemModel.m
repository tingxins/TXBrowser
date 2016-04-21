//
//  TXBasicItemModel.m
//  TXBrowser
//
//  Created by tingxins on 3/12/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import "TXBasicItemModel.h"

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



@end
