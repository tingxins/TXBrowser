//
//  TXCouponModel.h
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TXCouponModel : NSObject
@property (nonatomic, assign) NSInteger availableNum;
@property (nonatomic, strong) NSString * couponSign;
@property (nonatomic, assign) NSInteger totalNum;
@property (nonatomic, assign) NSInteger usedNum;

@end
