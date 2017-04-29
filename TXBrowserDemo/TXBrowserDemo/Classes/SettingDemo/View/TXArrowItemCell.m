//
//  TXArrowItemCell.m
//  TXBrowserDemo
//
//  Created by tingxins on 27/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXArrowItemCell.h"
#import "TXArrowItemModel.h"

@interface TXArrowItemCell()

@property (weak, nonatomic) IBOutlet UILabel *itemTitleLabel;

@end

@implementation TXArrowItemCell

- (void)setBasicItemModel:(TXBasicItemModel *)basicItemModel {
    [super setBasicItemModel:basicItemModel];
    
    if ([self.basicItemModel isKindOfClass:[TXArrowItemModel class]]) {
        self.itemTitleLabel.text = basicItemModel.basicItemTitle;
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
