//
//  TXArrowImageItemModel.h
//  TXBrowser
//
//  Created by tingxins on 3/12/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import "TXArrowItemModel.h"

@interface TXArrowImageItemModel : TXArrowItemModel

@property (copy, nonatomic) NSString *imageName;

/** 不进行初始化 **/
@property (copy, nonatomic) NSString *customAccessoryText;

- (instancetype)initArrowImageItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle imageName:(NSString *)imageName operation:(TXBasicItemOperation )operation;

+ (instancetype)arrowImageItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle imageName:(NSString *)imageName operation:(TXBasicItemOperation )operation;

@end
