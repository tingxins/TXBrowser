//
//  TXSwitchImageItemModel.m
//  TXBrowser
//
//  Created by tingxins on 3/12/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import "TXSwitchImageItemModel.h"

@implementation TXSwitchImageItemModel

- (instancetype)initSwitchImageItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle imageName:(NSString *)imageName operation:(TXBasicItemOperation)operation {
    if (self = [super initBasicItemModelWithClassType:basicClassType title:basicItemTitle operation:operation]) {
        self.imageName = imageName;
    }
    return self;
}

+ (instancetype)switchImageItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle imageName:(NSString *)imageName operation:(TXBasicItemOperation)operation {
    return [[self alloc] initSwitchImageItemModelWithClassType:basicClassType title:basicItemTitle imageName:imageName operation:operation];
}

@end
