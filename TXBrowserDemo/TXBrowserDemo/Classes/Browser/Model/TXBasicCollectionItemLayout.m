//
//  TXBasicCollectionItemLayout.m
//  TXBrowser
//
//  Created by tingxins on 3/24/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import "TXBasicCollectionItemLayout.h"

@implementation TXBasicCollectionItemLayout
//内容区域的大小
-(CGSize)collectionViewContentSize{
    // 220是一个调解的值
    // 防止除不尽时，多出的一行
    return CGSizeMake((TXStandardForWidth(TXBasicCollectionViewWH) * 6 + 10 * 6 - 10), TXStandardForHeight(TXBasicCollectionViewWH));
}

//生成每一个item的布局属性对象
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *array = [NSMutableArray array];
    CGFloat itemCount = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i=0; i<itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [array addObject:attributes];
    }
    
    
    return array;
}
//根据item的indexPath返回具体的布局属性对象
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    // 创建布局属性对象
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat placeholder = 10;
    CGFloat attributesW = TXStandardForWidth(TXBasicCollectionViewWH);
    CGFloat attributesH = TXStandardForHeight(TXBasicCollectionViewWH);
    CGFloat attributesX = (placeholder + attributesW) * indexPath.row;
    CGFloat attributesY = 0;
    attributes.frame = CGRectMake(attributesX, attributesY, attributesW, attributesH);
    return attributes;
}

@end
