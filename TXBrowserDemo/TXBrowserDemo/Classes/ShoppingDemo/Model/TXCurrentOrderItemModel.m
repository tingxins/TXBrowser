//
//  TXCurrentOrderItemModel.m
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXCurrentOrderItemModel.h"
#import "TXCurrentOrderModel.h"
#import "TXCommoditiesModel.h"

NSString * const kDetailButtonEventTouchUpInside = @"kDetailButtonEventTouchUpInside";

@implementation TXCurrentOrderItemModel

- (void)setCurrentOrderModel:(TXCurrentOrderModel *)currentOrderModel {
    _currentOrderModel = currentOrderModel;
    
    self.cellH = 140;
}

@end
