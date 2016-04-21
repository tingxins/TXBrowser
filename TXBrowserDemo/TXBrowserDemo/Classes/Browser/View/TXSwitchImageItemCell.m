//
//  TXSwitchImageItemCell.m
//  TXBrowser
//
//  Created by tingxins on 16/3/12.
//  Copyright © 2016年 TINGXINS. All rights reserved.
//

#import "TXSwitchImageItemCell.h"

@implementation TXSwitchImageItemCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        TXLog(@"initWithStyle:%@",NSStringFromClass([TXSwitchImageItemCell class]));
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
