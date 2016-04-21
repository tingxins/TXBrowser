//
//  TXBasicCollectionItemView.m
//  TXBrowser
//
//  Created by tingxins on 3/24/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import "TXBasicCollectionItemView.h"

@implementation TXBasicCollectionItemView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        self.showsHorizontalScrollIndicator = NO;
        self.bounces = NO;
        self.backgroundColor = RGB(239, 239, 244);
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
