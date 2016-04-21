//
//  TXArrowImageItemCell.m
//  TXBrowser
//
//  Created by tingxins on 16/3/12.
//  Copyright © 2016年 TINGXINS. All rights reserved.
//

#import "TXArrowImageItemCell.h"
#import "TXArrowImageItemModel.h"

@interface TXArrowImageItemCell ()

@property (weak, nonatomic) UILabel     *customAccessoryLabel;

@end

@implementation TXArrowImageItemCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        TXLog(@"initWithStyle:%@",NSStringFromClass([TXArrowImageItemCell class]));
        UILabel *customAccessoryLabel = [[UILabel alloc] init];
        self.customAccessoryLabel = customAccessoryLabel;
        self.customAccessoryLabel.textColor = [UIColor lightGrayColor];
        self.customAccessoryLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:customAccessoryLabel];
        self.imageView.layer.cornerRadius = 8;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

- (void)setBasicItemModel:(TXBasicItemModel *)basicItemModel {
    [super setBasicItemModel:basicItemModel];
    if ([basicItemModel isKindOfClass:[TXArrowImageItemModel class]]) {
        TXArrowImageItemModel *arrowImageItemModel = (TXArrowImageItemModel *)self.basicItemModel;
        self.imageView.image = [UIImage imageNamed:arrowImageItemModel.imageName];
        if (arrowImageItemModel.customAccessoryText) {
            self.customAccessoryLabel.hidden = NO;
            self.customAccessoryLabel.text = arrowImageItemModel.customAccessoryText;
        }else {
            self.customAccessoryLabel.hidden = YES;
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (!self.customAccessoryLabel.hidden) {
        self.customAccessoryLabel.frame = CGRectMake(CGRectGetMinX(self.customAccessoryImageView.frame) - 30, 0, 30, self.bounds.size.height);
    }
}
@end
