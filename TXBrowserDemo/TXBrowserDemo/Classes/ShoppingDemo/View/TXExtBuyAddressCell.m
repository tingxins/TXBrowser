//
//  TXExtBuyAddressCell.m
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXExtBuyAddressCell.h"
#import "TXAddressItemModel.h"
#import "TXAddressModel.h"

@interface TXExtBuyAddressCell ()

@property (weak, nonatomic) IBOutlet UILabel *orderOwnerLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderMobileLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderAddressLabel;

@end

@implementation TXExtBuyAddressCell

- (void)setBasicItemModel:(TXBasicItemModel *)basicItemModel {
    [super setBasicItemModel:basicItemModel];
    
    if ([basicItemModel isKindOfClass:[TXAddressItemModel class]]) {
        TXAddressItemModel *addressItemModel = (TXAddressItemModel *)basicItemModel;
        TXAddressModel *addressModel = addressItemModel.addressModel;
        
        if (!addressModel) return;
        
        self.orderOwnerLabel.text = addressModel.Name;
        self.orderMobileLabel.text = addressModel.Mobile;
        self.orderAddressLabel.text = addressModel.Where;
    }
}

//- (void)setAddressItemModel:(TXAddressItemModel *)addressItemModel {
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
