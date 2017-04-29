//
//  TXAdditionalOrderItemModel.m
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXAdditionalOrderItemModel.h"
#import "TXAdditionalOrderModel.h"

@implementation TXAdditionalOrderItemModel

- (void)setAdditionalOrderModel:(TXAdditionalOrderModel *)additionalOrderModel {
    _additionalOrderModel = additionalOrderModel;
    
    // 此处动态计算 cell 内部布局（如果采用 nib，仅计算高度即可）
    // 为了方便，此处 cell 高度固定
    self.cellH = 44;
}

@end
