//
//  TXBasicCollectionItemCell.m
//  TXBrowser
//
//  Created by tingxins on 3/24/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import "TXBasicCollectionItemCell.h"
#import "TXBasicCollectionItemView.h"
#import "TXBasicCollectionViewCell.h"

#import "TXBasicCollectionItemLayout.h"

#import "TXBasicCollectionItemModel.h"

@interface TXBasicCollectionItemCell () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) TXBasicCollectionItemView *collectionItemView;

@property (strong, nonatomic) NSMutableArray *collectionDatasource;

@end

@implementation TXBasicCollectionItemCell

- (NSMutableArray *)collectionDatasource {
    if (_collectionDatasource) return _collectionDatasource;
    return _collectionDatasource = [NSMutableArray array];
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        TXLog(@"initWithStyle:%@, self.bounds:%@",NSStringFromClass([TXBasicCollectionItemCell class]), NSStringFromCGRect(self.bounds));
        TXBasicCollectionItemView *collectionItemView = [[TXBasicCollectionItemView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) collectionViewLayout:[[TXBasicCollectionItemLayout alloc]init]];
        self.collectionItemView = collectionItemView;
        [self.collectionItemView registerClass:[TXBasicCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([TXBasicCollectionViewCell class])];
        self.collectionItemView.delegate = self;
        self.collectionItemView.dataSource = self;
        [self.contentView addSubview:collectionItemView];
    }
    return self;
}

- (void)setBasicItemModel:(TXBasicItemModel *)basicItemModel {
    [super setBasicItemModel:basicItemModel];
    if ([self.basicItemModel isKindOfClass:[TXBasicCollectionItemModel class]]) {
        TXLog(@"TXBasicCollectionItemModel");
        TXBasicCollectionItemModel *basicCollectionItemModel = (TXBasicCollectionItemModel *)basicItemModel;
        self.collectionDatasource = [NSMutableArray arrayWithArray:basicCollectionItemModel.collectionItems];
        [self.collectionItemView reloadData];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionItemView.frame = self.bounds;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UICollectionView + Delegate + Datasource

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    TXLog(@"%@", NSStringFromCGRect(self.collectionItemView.frame));
    return self.collectionDatasource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TXBasicCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([TXBasicCollectionViewCell class]) forIndexPath:indexPath];
    cell.basicItemModel = self.collectionDatasource[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    TXLog(@"collectionView_didSelectItemAtIndexPath");
    
    TXBasicCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([TXBasicCollectionViewCell class]) forIndexPath:indexPath];
    cell.basicItemModel = self.collectionDatasource[indexPath.row];
    if (cell.basicItemModel.operation) {
        cell.basicItemModel.operation();
    }
}

@end
