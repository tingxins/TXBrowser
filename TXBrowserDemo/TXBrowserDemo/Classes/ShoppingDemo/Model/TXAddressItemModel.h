//
//  TXAddressItemModel.h
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXBasicItemModel.h"

@class TXAddressModel;

@interface TXAddressItemModel : TXBasicItemModel

@property (strong, nonatomic) TXAddressModel *addressModel;

@end
