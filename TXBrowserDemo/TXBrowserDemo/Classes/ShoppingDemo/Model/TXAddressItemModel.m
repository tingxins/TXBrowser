//
//  TXAddressItemModel.m
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXAddressItemModel.h"

@implementation TXAddressItemModel

- (void)setAddressModel:(TXAddressModel *)addressModel {
    _addressModel = addressModel;
    
    // 如果 cell 高度会动态变化，在此处动态计算 cell 内部各控件布局（如果采用 nib，仅计算高度即可）
    self.cellH = 90;
}

@end
