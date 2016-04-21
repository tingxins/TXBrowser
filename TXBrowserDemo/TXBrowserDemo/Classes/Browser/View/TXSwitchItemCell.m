//
//  TXSwitchItemCell.m
//  TXBrowser
//
//  Created by tingxins on 16/3/12.
//  Copyright © 2016年 TINGXINS. All rights reserved.
//

#import "TXSwitchItemCell.h"
#import "TXSwitchItemModel.h"

@interface TXSwitchItemCell ()

@property (weak, nonatomic) UISwitch *switchView;

@end

@implementation TXSwitchItemCell

- (UISwitch *)switchView {
    if (_switchView) return _switchView;
    UISwitch *switchView = [[UISwitch alloc] init];
    [switchView addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:switchView];
    _switchView = switchView;
    return _switchView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        TXLog(@"initWithStyle:%@",NSStringFromClass([TXSwitchItemCell class]));
    }
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    return self;
}

- (void)setBasicItemModel:(TXBasicItemModel *)basicItemModel {
    [super setBasicItemModel:basicItemModel];
    self.accessoryView = self.switchView;
    [self canOrNotPerformBlock:^(TXSwitchItemModel *switchItemModel) {
        if (switchItemModel.defaultInitaiOperation) {
            self.switchView.on = switchItemModel.defaultInitaiOperation();
        }
    }];
}

- (void)switchValueChanged:(UISwitch *)switchView {
    [self canOrNotPerformBlock:^(TXSwitchItemModel *switchItemModel) {
        if (switchItemModel.switchItemOperation) {
            switchItemModel.switchItemOperation(switchView.isOn);
        }
    }];
}

- (void) canOrNotPerformBlock:(void(^)(TXSwitchItemModel *switchItemModel))block {
    if ([self.basicItemModel isKindOfClass:[TXSwitchItemModel class]]) {
        TXSwitchItemModel *switchItemModel = (TXSwitchItemModel *)self.basicItemModel;
        block(switchItemModel);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

@end
