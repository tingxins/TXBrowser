//
//  TXBasicCollectionViewCell.m
//  TXBrowser
//
//  Created by tingxins on 3/24/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import "TXBasicCollectionViewCell.h"
#import "TXBasicCollectionItemModel.h"

@interface TXBasicCollectionViewCell ()

@property (weak, nonatomic) UILabel *basicTitleLabel;

@end

@implementation TXBasicCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UILabel *basicTitleLabel = [[UILabel alloc] init];
        basicTitleLabel.textAlignment = NSTextAlignmentCenter;
        basicTitleLabel.font = [UIFont systemFontOfSize:14];
        basicTitleLabel.backgroundColor = [UIColor lightGrayColor];
        self.basicTitleLabel = basicTitleLabel;
        [self.contentView addSubview:basicTitleLabel];
    }
    return self;
}

- (void)setBasicItemModel:(TXBasicItemModel *)basicItemModel {
    _basicItemModel = basicItemModel;
    self.basicTitleLabel.text = self.basicItemModel.basicItemTitle;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.basicTitleLabel.frame = self.bounds;
}

@end
