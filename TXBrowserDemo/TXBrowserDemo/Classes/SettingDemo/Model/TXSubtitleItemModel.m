//
//  TXSubtitleItemModel.m
//  TXBrowserDemo
//
//  Created by tingxins on 27/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXSubtitleItemModel.h"

@implementation TXSubtitleItemModel

- (instancetype)initClassType:(Class)cls Title:(NSString *)title subtitle:(NSString *)subtitle operation:(TXBasicItemOperation)operation {
    if (self = [super initBasicItemModelWithClassType:cls title:title operation:operation]) {
        self.subtitle = subtitle;
    }
    return self;
}

+ (instancetype)subtitleItemWithclassType:(Class)cls Title:(NSString *)title subtitle:(NSString *)subtitle operation:(TXBasicItemOperation)operation {
    return [[self alloc] initClassType:cls Title:title subtitle:subtitle operation:operation];
}

@end
