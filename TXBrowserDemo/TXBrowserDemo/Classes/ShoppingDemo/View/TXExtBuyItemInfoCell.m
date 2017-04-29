//
//  TXExtBuyItemInfoCell.m
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXExtBuyItemInfoCell.h"
#import "UIImageView+WebCache.h"
#import "TXCurrentOrderItemModel.h"
#import "TXCurrentOrderModel.h"
#import "TXCommoditiesModel.h"

@interface TXExtBuyItemInfoCell ()

@property (weak, nonatomic) IBOutlet UIImageView *commoditiesImageView;
@property (weak, nonatomic) IBOutlet UILabel *commoditiesNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *commoditiesQualityLabel;
@property (weak, nonatomic) IBOutlet UILabel *commoditiesPriceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *returnGoodsIconView;
@property (weak, nonatomic) IBOutlet UILabel *returnGoodsMsgLabel;
@property (weak, nonatomic) IBOutlet UIButton *detailButton;

@end

@implementation TXExtBuyItemInfoCell

- (void)setBasicItemModel:(TXBasicItemModel *)basicItemModel {
    [super setBasicItemModel:basicItemModel];
    
    if ([basicItemModel isKindOfClass:[TXCurrentOrderItemModel class]]) {
        TXCurrentOrderItemModel *currentOrderItemModel = (TXCurrentOrderItemModel *)basicItemModel;
        TXCurrentOrderModel *currentOrderModel = currentOrderItemModel.currentOrderModel;
        TXCommoditiesModel *commoditiesModel = currentOrderModel.commodities;
        [self.commoditiesImageView sd_setImageWithURL:[NSURL URLWithString:commoditiesModel.imageUrl]];
        
        self.commoditiesNameLabel.text = commoditiesModel.name;
        
        self.commoditiesQualityLabel.text = commoditiesModel.num;
        
        self.commoditiesPriceLabel.text = commoditiesModel.jdPrice;
        
        [self.returnGoodsIconView sd_setImageWithURL:[NSURL URLWithString:commoditiesModel.returnGoodsIcon]];
        
        self.returnGoodsMsgLabel.text = commoditiesModel.returnGoodsMsg;
    }
}

- (IBAction)didClickDetailBtn:(UIButton *)sender {
    TXBasicItemBlock block = [self.basicItemModel executeWithTarget:kDetailButtonEventTouchUpInside];
    if (block) {
        block(sender, self, self.basicItemModel);
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
