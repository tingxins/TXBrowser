//
//  SettingViewController.m
//  TXBrowserDemo
//
//  Created by tingxins on 27/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "SettingViewController.h"

#import "TXItemGroupModel.h"

#import "TXSubtitleItemModel.h"
#import "TXSubtitleItemCell.h"

#import "TXSwitchItemModel.h"
#import "TXSwitchItemCell.h"

#import "TXArrowItemModel.h"
#import "TXArrowItemCell.h"

#import "TXHeaderFooterView.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSettingDataSource];
}

- (void)setupSettingDataSource {
    /** 1.优先为 nib 文件注册 */
    [self registerNibWithClasses:@[[TXSubtitleItemCell class], [TXSwitchItemCell class], [TXArrowItemCell class]]];
    
    /** 2.添加数据模型 */
    [self addGroup0];
    
    [self addGroup1];
    
    /** optional */
    [self addHeaderOrFooterView];
    
    /** 3.刷新 */
    [self.settingTableView reloadData];
}

- (void)addGroup0 {
    __weak typeof(self) weakSelf = self;
    TXSubtitleItemModel *cacheItem = [TXSubtitleItemModel subtitleItemWithclassType:[TXSubtitleItemCell class] Title:@"清除缓存" subtitle:@"10.88 MB" operation:^(TXBasicItemModel *currentModel) {
        NSLog(@"%@", currentModel.basicItemTitle);
        [weakSelf showAlertWithTitle:@"清除缓存" message:@"10.88 MB"];
    }];
    
    TXSubtitleItemModel *fontItem = [TXSubtitleItemModel subtitleItemWithclassType:[TXSubtitleItemCell class] Title:@"字体大小" subtitle:@"中" operation:^(TXBasicItemModel *currentModel) {
        NSLog(@"%@", currentModel.basicItemTitle);
        [weakSelf showAlertWithTitle:@"字体大小" message:@"中"];
    }];
    
    TXSwitchItemModel *abstractItem = [TXSwitchItemModel basicItemModelWithClassType:[TXSwitchItemCell class] title:@"列表显示摘要" operation:^(TXBasicItemModel *currentModel) {
        NSLog(@"%@", currentModel.basicItemTitle);
        [weakSelf showAlertWithTitle:@"列表显示摘要" message:@""];
    }];
    
    // 配置其他响应事件
    [abstractItem configs:kSELSwitchValueChangeKey withBlock:^(id target, id response, TXBasicItemModel *currentModel) {
        NSLog(@"%@--%@--%@", target, response, currentModel.basicItemTitle);
        NSLog(@"%@",weakSelf.title);
        UISwitch *sw = (UISwitch *)target;
        [weakSelf showAlertWithTitle:@"列表显示摘要" message:[NSString stringWithFormat:@"UISwitch:%d", sw.isOn]];
    }];//switchValueChange
    
    //    [abstractItem configs:kSELSwitchValueChangeKey response:self withSEL:@selector(switchValueDidChange:)];
    
    TXSubtitleItemModel *wifiItem = [TXSubtitleItemModel subtitleItemWithclassType:[TXSubtitleItemCell class] Title:@"非 WiFi 网络流量" subtitle:@"最佳效果（下载大图）" operation:^(TXBasicItemModel *currentModel) {
        NSLog(@"%@", currentModel.basicItemTitle);
        [weakSelf showAlertWithTitle:@"非 WiFi 网络流量" message:@"最佳效果（下载大图）"];
    }];
    
    TXSubtitleItemModel *wifiPlayerItem = [TXSubtitleItemModel subtitleItemWithclassType:[TXSubtitleItemCell class] Title:@"非 WiFi 网络流量播放提醒" subtitle:@"提醒一次" operation:^(TXBasicItemModel *currentModel) {
        NSLog(@"%@", currentModel.basicItemTitle);
        [weakSelf showAlertWithTitle:@"非 WiFi 网络流量播放提醒" message:@"提醒一次"];
    }];
    
    TXItemGroupModel *group0 = [TXItemGroupModel itemGroupModelWithGroupHeaderTitle:@"第一分区头" groupFooterTitle:@"第一分区尾" groupMembers:@[cacheItem, fontItem, abstractItem, wifiItem, wifiPlayerItem]];
    
    [self.dataSource addObject:group0];
}

- (void)addGroup1 {
    __weak typeof(self) weakSelf = self;
    TXArrowItemModel *offlineItem = [TXArrowItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"离线下载" operation:^(TXBasicItemModel *currentModel) {
        NSLog(@"%@", currentModel.basicItemTitle);
        [weakSelf.navigationController pushViewController:[[SettingViewController alloc] init] animated:YES];
    }];
    
    TXArrowItemModel *otherItem = [TXArrowItemModel basicItemModelWithClassType:[TXArrowItemCell class] title:@"其他" operation:^(TXBasicItemModel *currentModel) {
        NSLog(@"%@", currentModel.basicItemTitle);
        [weakSelf.navigationController pushViewController:[[SettingViewController alloc] init] animated:YES];
    }];
    
//    offlineItem.notNib = YES;
//    otherItem.notNib = YES;
    
    TXItemGroupModel *group1 = [TXItemGroupModel itemGroupModelWithGroupHeaderTitle:@"第二分区头" groupFooterTitle:@"第二分区尾" groupMembers:@[offlineItem, otherItem]];
    
    [self.dataSource addObject:group1];
}

- (void)addHeaderOrFooterView {
    TXHeaderFooterView *headerView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([TXHeaderFooterView class]) owner:nil options:nil].firstObject;
    self.settingTableView.tableFooterView = headerView;
    
    TXHeaderFooterView *footerView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([TXHeaderFooterView class]) owner:nil options:nil].firstObject;
    self.settingTableView.tableHeaderView = footerView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)switchValueDidChange:(id)obj {
    NSLog(@"obj--%@", obj);
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alertController animated:YES completion:^{
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
