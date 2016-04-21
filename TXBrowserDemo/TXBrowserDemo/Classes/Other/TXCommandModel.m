//
//  TXCommandModel.m
//  TXBrowserDemo
//
//  Created by tingxins on 4/1/16.
//  Copyright © 2016 TBZ. All rights reserved.
//

#import "TXCommandModel.h"

@implementation TXCommandModel

- (instancetype)initCommandModelWithFCommand:(int)fCommand sCommand:(int)sCommand {
    if (self = [super init]) {
        self.fCommand = fCommand;
        self.sCommand = sCommand;
    }
    return self;
}

+ (instancetype)commandModelWithFCommand:(int)fCommand sCommand:(int)sCommand {
    return [[self alloc] initCommandModelWithFCommand:fCommand sCommand:sCommand];
}

@end
