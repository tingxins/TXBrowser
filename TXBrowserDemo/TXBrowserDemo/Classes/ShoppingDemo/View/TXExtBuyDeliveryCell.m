//
//  TXExtBuyDeliveryCell.m
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXExtBuyDeliveryCell.h"
#import "TXDeliveryItemModel.h"
#import "TXDeliveryModel.h"

@interface TXExtBuyDeliveryCell ()
@property (weak, nonatomic) IBOutlet UILabel *payTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *expressTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *payTipLabel;

@end

@implementation TXExtBuyDeliveryCell

- (void)setBasicItemModel:(TXBasicItemModel *)basicItemModel {
    [super setBasicItemModel:basicItemModel];
    
    if ([basicItemModel isKindOfClass:[TXDeliveryItemModel class]]) {
        TXDeliveryItemModel *deliveryItemModel = (TXDeliveryItemModel *)basicItemModel;
        TXDeliveryModel *deliveryModel = deliveryItemModel.deliveryModel;
        
        self.expressTypeLabel.text = deliveryModel.name;
        self.payTipLabel.text = deliveryModel.promiseDate;
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
