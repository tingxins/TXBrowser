//
//  TXBasicItemCell.h
//  TXBrowser
//
//  Created by tingxins on 3/12/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TXBasicItemModel.h"

@interface TXBasicItemCell : UITableViewCell

+ (instancetype) basicItemCellWithTableView:(UITableView *)tableView;

+ (instancetype) basicItemCellWithTableView:(UITableView *)tableView classType:(Class)classType identifier:(NSString *)identifier;

@property (strong, nonatomic) TXBasicItemModel *basicItemModel;

@end
