//
//  TXDeliveryModel.h
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TXDeliveryModel : NSObject

@property (nonatomic, assign) BOOL available;
@property (nonatomic, strong) NSString * descriptionField;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) BOOL isSopOtherShipment;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * promiseDate;
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, assign) NSInteger shipmentId;
@property (nonatomic, strong) NSString * sopOtherShipmentName;

@end
