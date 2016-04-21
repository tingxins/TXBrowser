//
//  TXCommandModel.h
//  TXBrowserDemo
//
//  Created by tingxins on 4/1/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TXCommandModel : NSObject

@property (assign, nonatomic) int fCommand;

@property (assign, nonatomic) int sCommand;

- (instancetype)initCommandModelWithFCommand:(int)fCommand sCommand:(int)sCommand;

+ (instancetype)commandModelWithFCommand:(int)fCommand sCommand:(int)sCommand;

@end
