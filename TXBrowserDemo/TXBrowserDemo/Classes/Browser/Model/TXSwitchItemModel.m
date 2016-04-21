//
//  TXSwitchItemModel.m
//  TXBrowser
//
//  Created by tingxins on 3/12/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import "TXSwitchItemModel.h"

@implementation TXSwitchItemModel

- (instancetype)initSwitchItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle operation:(TXBasicItemOperation)operation switchItemOperation:(TXSwitchItemOperation)switchItemOperation {
    if (self = [super initBasicItemModelWithClassType:basicClassType title:basicItemTitle operation:operation]) {
        self.switchItemOperation = switchItemOperation;
    }
    return self;
}

+ (instancetype)switchItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle operation:(TXBasicItemOperation)operation switchItemOperation:(TXSwitchItemOperation)switchItemOperation {
    return [[self alloc] initSwitchItemModelWithClassType:basicClassType title:basicItemTitle operation:operation switchItemOperation:switchItemOperation];
}

@end
