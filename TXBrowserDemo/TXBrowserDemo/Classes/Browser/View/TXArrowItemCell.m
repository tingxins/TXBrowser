//
//  TXArrowItemCell.m
//  TXBrowser
//
//  Created by tingxins on 16/3/12.
//  Copyright © 2016年 TINGXINS. All rights reserved.
//

#import "TXArrowItemCell.h"
#import "TXArrowItemModel.h"

@interface TXArrowItemCell ()

@end

@implementation TXArrowItemCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        TXLog(@"initWithStyle:%@",NSStringFromClass([TXArrowItemCell class]));
        UIImageView *customAccessoryImageView = [[UIImageView alloc] init];
        self.customAccessoryImageView = customAccessoryImageView;
        self.customAccessoryImageView.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:customAccessoryImageView];
    }
    return self;
}

- (void)setBasicItemModel:(TXBasicItemModel *)basicItemModel {
    [super setBasicItemModel:basicItemModel];
    TXArrowItemModel *arrowItemModel = (TXArrowItemModel *)basicItemModel;
    if (arrowItemModel.customAccessoryImageName) {
        self.customAccessoryImageView.hidden = NO;
        self.customAccessoryImageView.image = [UIImage imageNamed:arrowItemModel.customAccessoryImageName];
        self.accessoryType = UITableViewCellAccessoryNone;
    }else {
        self.customAccessoryImageView.hidden = YES;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (!self.customAccessoryImageView.hidden) {
        CGFloat customAccessoryImageViewW = 40;
        self.customAccessoryImageView.frame = CGRectMake(self.bounds.size.width - customAccessoryImageViewW, 0, customAccessoryImageViewW, self.bounds.size.height);
    }
}

@end
