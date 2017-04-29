//
//  TXBasicItemLayout.h
//  AwesomeTableView
//
//  Created by tingxins on 26/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//  布局模型

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TXBasicItemModel;

@interface TXBasicItemLayout : NSObject
// 模型数据
@property (strong, nonatomic) TXBasicItemModel *basicItemModel;
// 模型数据总高度计算
@property (assign, nonatomic) CGFloat height;

@end
