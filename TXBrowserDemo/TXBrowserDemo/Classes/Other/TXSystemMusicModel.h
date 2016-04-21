//
//  TXSystemMusicModel.h
//  TXBrowserDemo
//
//  Created by tingxins on 4/7/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TXCommandModel;

@interface TXSystemMusicModel : NSObject

@property (copy, nonatomic) NSString *musicName;

@property (strong, nonatomic) TXCommandModel *commandModel;

- (instancetype) initSystemMusicModelWithName:(NSString *)musicName commandModel:(TXCommandModel *)commandModel;

+ (instancetype) systemMusicModelWithName:(NSString *)musicName commandModel:(TXCommandModel *)commandModel;

@end
