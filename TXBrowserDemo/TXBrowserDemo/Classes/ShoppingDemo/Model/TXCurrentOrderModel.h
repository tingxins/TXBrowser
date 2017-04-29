//
//  TXCurrentOrderModel.h
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TXCommoditiesModel, TXDeliveryModel;

@interface TXCurrentOrderModel : NSObject

@property (nonatomic, strong) NSString * IsNewCouponInterface;
@property (nonatomic, strong) NSString * IsRelySubmitNoStock;
@property (nonatomic, strong) NSString * addAddressSwitch;
@property (nonatomic, strong) NSString * addressChangeMessage;
@property (nonatomic, strong) NSString * addressMessage1;
@property (nonatomic, strong) NSString * addressMessage2;
@property (nonatomic, strong) NSString * backMessage;
@property (nonatomic, strong) NSString * bottomAddr;
@property (nonatomic, strong) NSString * bottomNotify;
@property (nonatomic, strong) NSString * changeAreaMessage;
@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * deliveryChangeMsg;
@property (nonatomic, strong) NSString * deliveryMatchChar;
@property (nonatomic, assign) NSInteger discountAmount;
@property (nonatomic, strong) NSString * exceptionButton;
@property (nonatomic, strong) NSString * exceptionMsg;
@property (nonatomic, strong) NSString * freightRiskMatchChar;
@property (nonatomic, assign) NSInteger interruptTime;
@property (nonatomic, assign) NSInteger isNewJDBeanRule;
@property (nonatomic, assign) NSInteger jdbeanerror;
@property (nonatomic, strong) NSString * judgeAddress;
@property (nonatomic, strong) TXCommoditiesModel * commodities;
@property (nonatomic, strong) NSString * productPriceMatchChar;
@property (nonatomic, strong) NSString * promotionTimeMsg;
@property (nonatomic, strong) NSString * remoteFeeChar;
@property (nonatomic, strong) NSString * submitModeSwitch;
@property (nonatomic, assign) NSInteger supportPaymentType;
@property (nonatomic, strong) NSString * taxMatchChar;
@property (nonatomic, strong) NSArray * yunfeeList;
@property (nonatomic, strong) NSString * yunfeiMatchChar;

@property (nonatomic, strong) TXDeliveryModel *deliveryModel;
@property (nonatomic, copy) NSString *paymentName;
@end
