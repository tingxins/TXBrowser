//
//  TXSettingViewController.m
//  TXBrowser
//
//  Created by tingxins on 3/11/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import "TXSettingViewController.h"

@interface TXSettingViewController ()

@end

@implementation TXSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBasicViewInfos];
    
    [self setupDataSource];
    
    [self setupSomeSubviews];
}

- (void)setupBasicViewInfos {
    self.title = @"更多";
}

- (void)setupDataSource {
    /** 1.第一组 **/
    TXArrowItemModel *phoneService = [TXArrowItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"致电客服" operation:^{
        /** 点击cell操作 **/
        
    }];
    TXArrowItemModel *feedback = [TXArrowItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"用户反馈" operation:^{
        /** 点击cell操作 **/
        
    }];
    TXArrowItemModel *vipPlanning = [TXArrowItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"VIP计划" operation:^{
        /** 点击cell操作 **/
        
    }];
    TXArrowItemModel *aboutUs = [TXArrowItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"关于我们" operation:^{
        /** 点击cell操作 **/
        
    }];
    TXArrowItemModel *privacyP = [TXArrowItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"隐私政策" operation:^{
        /** 点击cell操作 **/
        
    }];
    
    TXItemGroupModel *group0 = [TXItemGroupModel itemGroupModelWithGroupHeaderTitle:@"" groupFooterTitle:@"" groupMembers:@[phoneService, feedback, vipPlanning, aboutUs, privacyP]];
    
    /** 2.第二组 **/
    TXArrowItemModel *rate = [TXArrowItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"给个好评" operation:^{
        /** 点击cell操作 **/
    }];
    TXArrowItemModel *versionBack = [TXArrowItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"新版吐槽" operation:^{
        /** 点击cell操作 **/
    }];
    TXArrowItemModel *securityCenter = [TXArrowItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"安全中心" operation:^{
        /** 点击cell操作 **/
    }];
    
    TXItemGroupModel *group1 = [TXItemGroupModel itemGroupModelWithGroupHeaderTitle:@"" groupFooterTitle:@"" groupMembers:@[rate, versionBack, securityCenter]];
    
    [self.dataSource addObject:group0];
    [self.dataSource addObject:group1];
    [self.settingTableView reloadData];
}

- (void)setupSomeSubviews {
    
}

- (void)recurrenceController {
    
}

@end
