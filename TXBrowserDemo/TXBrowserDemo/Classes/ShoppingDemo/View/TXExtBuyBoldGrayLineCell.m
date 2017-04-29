//
//  TXExtBuyBoldGrayLineCell.m
//  TXBrowserDemo
//
//  Created by tingxins on 29/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXExtBuyBoldGrayLineCell.h"
#import "TXBoldGrayLineItemModel.h"

@interface TXExtBuyBoldGrayLineCell ()

@property (weak, nonatomic) UIView *lineView;

@end

@implementation TXExtBuyBoldGrayLineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
        self.lineView = lineView;
        [self.contentView addSubview:lineView];
    }
    
    return self;
}

- (void)setBasicItemModel:(TXBasicItemModel *)basicItemModel {
    [super setBasicItemModel:basicItemModel];
    
    // 此处可配置相关属性
    if ([basicItemModel isKindOfClass:[TXBoldGrayLineItemModel class]]) {
        TXBoldGrayLineItemModel *boldGrayLineItemModel = (TXBoldGrayLineItemModel *)basicItemModel;
        self.lineView.backgroundColor = [UIColor lightGrayColor];
        self.lineView.alpha = 0.2;
        
        CGSize  size = [UIScreen mainScreen].bounds.size;
        CGFloat paddingXL = boldGrayLineItemModel.offsets.left;
        CGFloat paddingXR = boldGrayLineItemModel.offsets.right;
        CGFloat lineViewW = size.width - paddingXL - paddingXR;
        self.lineView.frame = CGRectMake(paddingXL, 0, lineViewW, boldGrayLineItemModel.cellH);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
