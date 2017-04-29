//
//  TXAdditionalOrderItemModel.h
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXBasicItemModel.h"

@class TXAdditionalOrderModel;

@interface TXAdditionalOrderItemModel : TXBasicItemModel

@property (strong, nonatomic) TXAdditionalOrderModel *additionalOrderModel;

/** Just for demo */
@property (nonatomic, copy) NSString *subname;

@end
