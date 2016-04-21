//
//  TXTextItemModel.m
//  TXBrowser
//
//  Created by tingxins on 16/3/13.
//  Copyright © 2016年 TINGXINS. All rights reserved.
//

#import "TXTextItemModel.h"

@implementation TXTextItemModel

- (instancetype)initTextItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle repeatCountStr:(NSString *)repeatCountStr operation:(TXBasicItemOperation)operation textItemOperation:(TXTextItemOperation)textItemOperation{
    if (self = [super initBasicItemModelWithClassType:basicClassType title:basicItemTitle operation:operation]) {
        self.repeatCountStr = repeatCountStr;
        self.textItemOperation = textItemOperation;
    }
    return self;
}

+ (instancetype)textItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle repeatCountStr:(NSString *)repeatCountStr operation:(TXBasicItemOperation)operation textItemOperation:(TXTextItemOperation)textItemOperation{
    return [[self alloc] initTextItemModelWithClassType:basicClassType title:basicItemTitle repeatCountStr:repeatCountStr operation:operation textItemOperation:textItemOperation];
}

@end
