//
//  TXBasicCollectionItemModel.m
//  TXBrowser
//
//  Created by tingxins on 3/24/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import "TXBasicCollectionItemModel.h"

@implementation TXBasicCollectionItemModel

- (instancetype)initBasicCollectionItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle items:(NSMutableArray *)collectionItems operation:(TXBasicItemOperation)operation{
    if (self = [super initBasicItemModelWithClassType:basicClassType title:basicItemTitle operation:operation]) {
        self.collectionItems = collectionItems;
    }
    return self;
}

+ (instancetype)basicCollectionItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle items:(NSMutableArray *)collectionItems operation:(TXBasicItemOperation)operation {
    return [[self alloc] initBasicCollectionItemModelWithClassType:basicClassType title:basicItemTitle items:collectionItems operation:operation];
}

@end
