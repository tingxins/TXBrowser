//
//  TXSubtitleItemCell.m
//  TXBrowserDemo
//
//  Created by tingxins on 27/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXSubtitleItemCell.h"
#import "TXSubtitleItemModel.h"

@interface TXSubtitleItemCell ()

@property (weak, nonatomic) IBOutlet UILabel *itemTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *itemSubtitleLabel;

@end

@implementation TXSubtitleItemCell

- (void)setBasicItemModel:(TXBasicItemModel *)basicItemModel {
    [super setBasicItemModel:basicItemModel];
    
    if ([self.basicItemModel isKindOfClass:[TXSubtitleItemModel class]]) {
        TXSubtitleItemModel *model = (TXSubtitleItemModel *)basicItemModel;
        self.itemTitleLabel.text = model.basicItemTitle;
        self.itemSubtitleLabel.text = model.subtitle;
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
