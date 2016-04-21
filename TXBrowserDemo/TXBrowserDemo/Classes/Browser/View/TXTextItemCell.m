//
//  TXTextItemCell.m
//  TXBrowser
//
//  Created by tingxins on 16/3/13.
//  Copyright © 2016年 TINGXINS. All rights reserved.
//

#import "TXTextItemCell.h"
#import "TXTextItemModel.h"

@interface TXTextItemCell () <UITextFieldDelegate>

@property (weak, nonatomic) UITextField *textField;

@end

@implementation TXTextItemCell

- (UITextField *)textField {
    if (_textField) return _textField;
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 60, 25)];
    _textField = textField;
    _textField.delegate = self;
    _textField.textAlignment = NSTextAlignmentCenter;
    _textField.textColor = [UIColor lightGrayColor];
    _textField.keyboardType = UIKeyboardTypeNamePhonePad;
    [self.contentView addSubview:textField];
    return _textField;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        TXLog(@"initWithStyle:%@",NSStringFromClass([TXTextItemCell class]));
    }
    return self;
}

- (void)setBasicItemModel:(TXBasicItemModel *)basicItemModel {
    [super setBasicItemModel:basicItemModel];
    self.accessoryView = self.textField;
    [self canOrNotPerformBlock:^(TXTextItemModel *textItemModel) {
        self.textField.text = textItemModel.repeatCountStr;
    }];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.textField.textColor = [UIColor blackColor];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self canOrNotPerformBlock:^(TXTextItemModel *textItemModel) {
        /** 判断输入是否为数字 **/
//        if ([self.textField.text isValidateNumber]) {
//            NSInteger repeatCount = [self.textField.text integerValue];
//            if (repeatCount > [TXDefaultMaxRepeatCount integerValue]) {
//                self.textField.text = TXDefaultMaxRepeatCount;
//            }
//            textItemModel.textItemOperation(self.textField.text);
//            self.textField.textColor = [UIColor lightGrayColor];
//            /** 关闭键盘 **/
//            [self endEditing:YES];
//        }else {
//            [MBProgressHUD showFailedHUDToView:[UIApplication sharedApplication].keyWindow title:@"请输入数字"];
//        }
    }];
    return YES;
}

- (void) canOrNotPerformBlock:(void(^)(TXTextItemModel *textItemModel))block {
    if ([self.basicItemModel isKindOfClass:[TXTextItemModel class]]) {
        TXTextItemModel *textItemModel = (TXTextItemModel *)self.basicItemModel;
        block(textItemModel);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
