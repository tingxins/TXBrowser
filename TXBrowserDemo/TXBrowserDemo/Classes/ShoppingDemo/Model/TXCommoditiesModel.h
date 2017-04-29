//
//  TXCommoditiesModel.h
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TXCommoditiesModel : NSObject

@property (nonatomic, strong) NSString * colorName;
@property (nonatomic, strong) NSString * colorValue;
@property (nonatomic, strong) NSArray * gifts;
@property (nonatomic, strong) NSString * hierarchy;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * imageUrl;
@property (nonatomic, assign) NSInteger internationalType;
@property (nonatomic, assign) BOOL isBigItem;
@property (nonatomic, assign) BOOL isFresh;
@property (nonatomic, assign) BOOL isMainSku;
@property (nonatomic, assign) BOOL isSamGoods;
@property (nonatomic, assign) BOOL isSamMemberPrice;
@property (nonatomic, assign) BOOL isXuzhong;
@property (nonatomic, strong) NSString * jdPrice;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * num;
@property (nonatomic, assign) NSInteger numInt;
@property (nonatomic, assign) BOOL overseaPurchase;
@property (nonatomic, strong) NSString * point;
@property (nonatomic, assign) NSInteger price;
@property (nonatomic, strong) NSString * promoId;
@property (nonatomic, strong) NSString * rePrice;
@property (nonatomic, strong) NSString * returnGoodsIcon;
@property (nonatomic, strong) NSString * returnGoodsMsg;
@property (nonatomic, assign) NSInteger serviceItemId;
@property (nonatomic, strong) NSString * sizeName;
@property (nonatomic, strong) NSString * sizeValue;
@property (nonatomic, strong) NSString * stockStatus;
@property (nonatomic, assign) NSInteger taxAmount;
@property (nonatomic, assign) NSInteger templateId;
@property (nonatomic, assign) NSInteger thirdCategoryId;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSString * venderId;
@property (nonatomic, assign) NSInteger venderType;
@property (nonatomic, assign) NSInteger volume;
@property (nonatomic, assign) CGFloat weight;

@end
