//
//  TXExtBuyOperationCell.m
//  TXBrowserDemo
//
//  Created by tingxins on 29/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXExtBuyOperationCell.h"

#import "TXAdditionalOrderItemModel.h"
#import "TXAdditionalOrderModel.h"
#import "TXCouponModel.h"

@interface TXExtBuyOperationCell ()

@property (weak, nonatomic) IBOutlet UILabel *operationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *operationTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *operationSubNameLabel;

@end

@implementation TXExtBuyOperationCell

- (void)setBasicItemModel:(TXBasicItemModel *)basicItemModel {
    [super setBasicItemModel:basicItemModel];
    
    if ([basicItemModel isKindOfClass:[TXAdditionalOrderItemModel class]]) {
        TXAdditionalOrderItemModel *additionalOrderItemModel = (TXAdditionalOrderItemModel *)basicItemModel;
        TXAdditionalOrderModel *additionalOrderModel = additionalOrderItemModel.additionalOrderModel;
        self.operationNameLabel.text = additionalOrderItemModel.basicItemTitle;
        
        self.operationSubNameLabel.text = additionalOrderItemModel.subname;
        
        TXCouponModel *couponModel = additionalOrderModel.couponInfos;
        self.operationTipLabel.text = couponModel.couponSign;
        
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
