//
//  TXTextItemModel.h
//  TXBrowser
//
//  Created by tingxins on 16/3/13.
//  Copyright © 2016年 TINGXINS. All rights reserved.
//
#import "TXBasicItemModel.h"
typedef void(^TXTextItemOperation) (NSString *repeatCountStr);

@interface TXTextItemModel : TXBasicItemModel

@property (copy, nonatomic) NSString *repeatCountStr;

@property (copy, nonatomic) TXTextItemOperation textItemOperation;

- (instancetype)initTextItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle repeatCountStr:(NSString *)repeatCountStr operation:(TXBasicItemOperation )operation textItemOperation:(TXTextItemOperation)textItemOperation;

+ (instancetype)textItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle repeatCountStr:(NSString *)repeatCountStr operation:(TXBasicItemOperation )operation textItemOperation:(TXTextItemOperation)textItemOperation;

@end
