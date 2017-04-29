//
//  TXBasicSettingViewController.h
//  TXBrowser
//
//  Created by tingxins on 3/12/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TXBasicItemCell.h"
#import "TXBasicItemModel.h"

@interface TXBasicSettingViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *dataSource;

@property (weak, nonatomic) UITableView *settingTableView;

- (void)registerNibWithClasses:(NSArray *)array;

@end
