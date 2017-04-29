//
//  TXBasicItemCell.m
//  TXBrowser
//
//  Created by tingxins on 3/12/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import "TXBasicItemCell.h"
#import <objc/runtime.h>

@implementation TXBasicItemCell

#pragma mark - Nib 加载方式

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

#pragma mark - 代码 加载方式

+ (instancetype)basicItemCellWithTableView:(UITableView *)tableView {
    return [self basicItemCellWithTableView:tableView classType:[TXBasicItemCell class] identifier:@"TXBasicItemCell"];
}

+ (instancetype)basicItemCellWithTableView:(UITableView *)tableView classType:(Class)classType identifier:(NSString *)identifier {
    
    TXBasicItemCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[classType alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setBasicItemModel:(TXBasicItemModel *)basicItemModel {
    _basicItemModel = basicItemModel;
    
//    self.textLabel.text = self.basicItemModel.basicItemTitle;
}
@end
