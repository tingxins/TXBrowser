//
//  TXSwitchImageItemModel.h
//  TXBrowser
//
//  Created by tingxins on 3/12/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import "TXSwitchItemModel.h"

@interface TXSwitchImageItemModel : TXSwitchItemModel

@property (copy, nonatomic) NSString *imageName;

- (instancetype)initSwitchImageItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle imageName:(NSString *)imageName operation:(TXBasicItemOperation )operation;

+ (instancetype)switchImageItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle imageName:(NSString *)imageName operation:(TXBasicItemOperation )operation;

@end
