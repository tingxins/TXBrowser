//
//  TXBasicItemCell.m
//  TXBrowser
//
//  Created by tingxins on 3/12/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import "TXBasicItemCell.h"
#import "TXSwitchImageItemCell.h"
#import "TXSwitchItemCell.h"
#import "TXArrowImageItemCell.h"
#import "TXArrowItemCell.h"


@implementation TXBasicItemCell

+ (instancetype)basicItemCellWithTableView:(UITableView *)tableView {
    return [self basicItemCellWithTableView:tableView classType:[TXBasicItemCell class] identifier:@"TXBasicItemCell"];
}

+ (instancetype)basicItemCellWithTableView:(UITableView *)tableView classType:(Class)classType identifier:(NSString *)identifier {
    
//    static NSString *identify = [NSString stringWithFormat:@"%@", identifier];
    TXBasicItemCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[classType alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        TXLog(@"initWithStyle:%@",NSStringFromClass([TXBasicItemCell class]));
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

- (void)setBasicItemModel:(TXBasicItemModel *)basicItemModel {
    _basicItemModel = basicItemModel;
    
    self.textLabel.text = self.basicItemModel.basicItemTitle;
}

@end
