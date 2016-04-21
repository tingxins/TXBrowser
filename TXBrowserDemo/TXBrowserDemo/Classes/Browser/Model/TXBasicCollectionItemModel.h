//
//  TXBasicCollectionItemModel.h
//  TXBrowser
//
//  Created by tingxins on 3/24/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TXBasicItemModel.h"

@interface TXBasicCollectionItemModel : TXBasicItemModel

/** 此数组中装有 TXBasicItemModel 模型 **/
@property (strong, nonatomic) NSMutableArray *collectionItems;

/** cell高度 **/
@property (assign, nonatomic) CGFloat collectionCellH;

- (instancetype) initBasicCollectionItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle items:(NSMutableArray *)collectionItems operation:(TXBasicItemOperation )operation ;

+ (instancetype) basicCollectionItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle items:(NSMutableArray *)collectionItems operation:(TXBasicItemOperation )operation;

@end
