//
//  TXBasicSettingViewController.h
//  TXBrowser
//
//  Created by tingxins on 3/12/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TXBasicItemCell.h"
#import "TXArrowItemCell.h"
#import "TXArrowImageItemCell.h"
#import "TXSwitchItemCell.h"
#import "TXSwitchImageItemCell.h"
#import "TXTextImageItemCell.h"
#import "TXBasicCollectionItemCell.h"

#import "TXItemGroupModel.h"
#import "TXBasicItemModel.h"
#import "TXArrowImageItemModel.h"
#import "TXSwitchImageItemModel.h"
#import "TXTextImageItemModel.h"
#import "TXBasicCollectionItemModel.h"

@interface TXBasicSettingViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *dataSource;

@property (weak, nonatomic) UITableView *settingTableView;

@end
