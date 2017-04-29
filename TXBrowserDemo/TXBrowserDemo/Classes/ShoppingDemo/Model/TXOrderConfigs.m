//
//  TXOrderConfigs.m
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXOrderConfigs.h"
#import "MJExtension.h"
#import "TXCurrentOrderModel.h"
#import "TXDeliveryModel.h"

@implementation TXOrderConfigs

+ (void) load {
    NSLog(@"TXOrderConfigs -- loading...");
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ruleMessage" : @"newRuleMessage"
                 };
    }];
    
    [TXCurrentOrderModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"commodities" : @"lastOderInfo.commodities[0]",
                 @"deliveryModel" : @"lastOderInfo.payShipMap.sopOtherShipment",
                 @"paymentName" : @"lastOderInfo.payShipMap.payment.paymentName"
                 };
    }];
}

@end
