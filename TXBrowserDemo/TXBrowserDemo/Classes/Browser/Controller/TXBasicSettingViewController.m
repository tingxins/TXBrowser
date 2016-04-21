//
//  TXBasicSettingViewController.m
//  TXBrowser
//
//  Created by tingxins on 3/12/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import "TXBasicSettingViewController.h"

@implementation TXBasicSettingViewController

- (NSMutableArray *)dataSource {
    if (_dataSource) return _dataSource;
    return _dataSource = [NSMutableArray array];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *settingTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.settingTableView = settingTableView;
    self.settingTableView.dataSource = self;
    self.settingTableView.delegate = self;
    [self.view addSubview:settingTableView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.settingTableView.frame = self.view.bounds;
}

#pragma mark - UITableViewDataSource + Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TXItemGroupModel *group = self.dataSource[section];
    return group.groupMembers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TXItemGroupModel *group = self.dataSource[indexPath.section];
    TXBasicItemModel *basicItemModel = group.groupMembers[indexPath.row];
    TXLog(@"basicClassType:%@__%@", NSStringFromClass(basicItemModel.basicClassType), NSStringFromClass([basicItemModel.basicClassType class]));
    TXBasicItemCell *cell = [TXBasicItemCell basicItemCellWithTableView:tableView classType:basicItemModel.basicClassType identifier:NSStringFromClass(basicItemModel.basicClassType)];
    TXLog(@"cell:%@", cell.class);
    cell.basicItemModel = basicItemModel;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TXItemGroupModel *group = self.dataSource[indexPath.section];
    TXBasicItemModel *basicItemModel = group.groupMembers[indexPath.row];
    if (basicItemModel.operation) {
        basicItemModel.operation();
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    TXItemGroupModel *group = self.dataSource[section];
    return group.groupHeaderTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    TXItemGroupModel *group = self.dataSource[section];
    return group.groupFooterTitle;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TXItemGroupModel *group = self.dataSource[indexPath.section];
    TXBasicItemModel *basicItemModel = group.groupMembers[indexPath.row];
    if ([basicItemModel isKindOfClass:[TXBasicCollectionItemModel class]]) {
        return TXBasicCollectionViewWH;
    }else {
        return 44;
    }
}

@end
