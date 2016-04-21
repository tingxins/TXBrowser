//
//  TXSystemMusicModel.m
//  TXBrowserDemo
//
//  Created by tingxins on 4/7/16.
//  Copyright © 2016 TBZ. All rights reserved.
//

#import "TXSystemMusicModel.h"

@implementation TXSystemMusicModel

- (instancetype)initSystemMusicModelWithName:(NSString *)musicName commandModel:(TXCommandModel *)commandModel {
    if (self = [super init]) {
        self.musicName = musicName;
        self.commandModel = commandModel;
    }
    return self;
}

+ (instancetype)systemMusicModelWithName:(NSString *)musicName commandModel:(TXCommandModel *)commandModel {
    return [[self alloc] initSystemMusicModelWithName:musicName commandModel:commandModel];
}

@end
