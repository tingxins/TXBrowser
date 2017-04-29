//
//  TXUsedJDBeanModel.h
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TXUsedJDBeanModel : NSObject

@property (nonatomic, assign) BOOL IsUseJdBean;
@property (nonatomic, strong) NSString * Message1;
@property (nonatomic, strong) NSString * Message2;
@property (nonatomic, assign) NSInteger canUseJdBeanCount;
@property (nonatomic, assign) BOOL flag;
@property (nonatomic, assign) BOOL isShowJd;
@property (nonatomic, assign) double jdBeanDiscount;
@property (nonatomic, assign) NSInteger minUseUnit;
@property (nonatomic, strong) NSString * ruleMessage; // newRuleMessage
@property (nonatomic, assign) NSInteger rate;
@property (nonatomic, assign) NSInteger totalJdBeanCount;
@property (nonatomic, assign) NSInteger useJdBeanCount;

@end
