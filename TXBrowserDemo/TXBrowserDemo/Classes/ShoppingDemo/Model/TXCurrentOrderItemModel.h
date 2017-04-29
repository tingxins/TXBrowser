//
//  TXCurrentOrderItemModel.h
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXBasicItemModel.h"

extern NSString * const kDetailButtonEventTouchUpInside;

@class TXCurrentOrderModel;

@interface TXCurrentOrderItemModel : TXBasicItemModel

@property (strong, nonatomic) TXCurrentOrderModel *currentOrderModel;

@end
