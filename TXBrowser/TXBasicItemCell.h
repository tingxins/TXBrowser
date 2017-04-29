//
//  TXBasicItemCell.h
//  TXBrowser
//
//  Created by tingxins on 3/12/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TXBasicItemModel.h"

typedef NS_ENUM(NSInteger, TXBasicItemCellStyle) {
    TXBasicItemCellStyleDefault,	// Simple cell with text label and optional image view (behavior of UITableViewCell in iPhoneOS 2.x)
    TXBasicItemCellStyleValue1,		// Left aligned label on left and right aligned label on right with blue text (Used in Settings)
    TXBasicItemCellStyleValue2,		// Right aligned label on left with blue text and left aligned label on right (Used in Phone/Contacts)
    TXBasicItemCellStyleSubtitle,	// Left aligned label on top and left aligned label on bottom with gray text (Used in iPod).
    TXBasicItemCellCustom // Custom your view
};

@interface TXBasicItemCell : UITableViewCell

+ (instancetype) basicItemCellWithTableView:(UITableView *)tableView;

+ (instancetype) basicItemCellWithTableView:(UITableView *)tableView classType:(Class)classType identifier:(NSString *)identifier;

@property (strong, nonatomic) TXBasicItemModel *basicItemModel;

@end
