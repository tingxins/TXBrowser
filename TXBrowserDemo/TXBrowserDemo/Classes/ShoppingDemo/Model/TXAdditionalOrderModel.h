//
//  TXAdditionalOrderModel.h
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TXCouponModel, TXUsedJDBeanModel;

@interface TXAdditionalOrderModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) TXCouponModel * couponInfos;
@property (nonatomic, strong) NSString * inputPasswordExplain;
@property (nonatomic, assign) BOOL isOpenPaymentPassword;
@property (nonatomic, assign) BOOL isShortPwd;
@property (nonatomic, assign) BOOL needRemark;
@property (nonatomic, strong) TXUsedJDBeanModel * usedJdBeanMap;

@end
