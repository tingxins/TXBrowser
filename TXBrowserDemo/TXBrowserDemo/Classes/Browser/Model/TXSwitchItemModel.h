//
//  TXSwitchItemModel.h
//  TXBrowser
//
//  Created by tingxins on 3/12/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//
#import "TXBasicItemModel.h"
typedef void(^TXSwitchItemOperation)(BOOL isOn);
typedef BOOL(^TXSwitchItemDefaultInitailOperation)();

@interface TXSwitchItemModel : TXBasicItemModel

@property (copy, nonatomic) TXSwitchItemOperation switchItemOperation;

/** 初始化操作，如：初始化开关Value */
@property (copy, nonatomic) TXSwitchItemDefaultInitailOperation defaultInitaiOperation;

- (instancetype)initSwitchItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle operation:(TXBasicItemOperation )operation switchItemOperation:(TXSwitchItemOperation)switchItemOperation;

+ (instancetype)switchItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle operation:(TXBasicItemOperation )operation switchItemOperation:(TXSwitchItemOperation)switchItemOperation;

@end
