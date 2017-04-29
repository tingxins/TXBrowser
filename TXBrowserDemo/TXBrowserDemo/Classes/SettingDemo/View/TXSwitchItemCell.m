//
//  TXSwitchItemCell.m
//  TXBrowserDemo
//
//  Created by tingxins on 27/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXSwitchItemCell.h"
#import "TXSwitchItemModel.h"

@interface TXSwitchItemCell ()

@property (weak, nonatomic) IBOutlet UILabel *itemTitleLabel;

@property (weak, nonatomic) IBOutlet UISwitch *itemSwitch;

@end

@implementation TXSwitchItemCell

- (void)setBasicItemModel:(TXBasicItemModel *)basicItemModel {
    [super setBasicItemModel:basicItemModel];
    
    if ([self.basicItemModel isKindOfClass:[TXSwitchItemModel class]]) {
        TXSwitchItemModel *model = (TXSwitchItemModel *)basicItemModel;
        self.itemTitleLabel.text = model.basicItemTitle;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.itemSwitch addTarget:self action:@selector(switchValueDidChange:) forControlEvents:UIControlEventValueChanged];
    // Initialization code
}

- (void)switchValueDidChange:(UISwitch *)target {
    /** 方式一：执行 value 改变 block */
    TXBasicItemBlock block = [self.basicItemModel executeWithTarget:kSELSwitchValueChangeKey];
    if (block) {
        block(self.itemSwitch, self, self.basicItemModel);
    }
    
    /** 方式二：执行 value 改变 sel */
//    [self.basicItemModel executeSELWithTarget:kSELSwitchValueChangeKey];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
