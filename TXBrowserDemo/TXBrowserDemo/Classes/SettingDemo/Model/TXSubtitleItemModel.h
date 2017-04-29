//
//  TXSubtitleItemModel.h
//  TXBrowserDemo
//
//  Created by tingxins on 27/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXBasicItemModel.h"

@interface TXSubtitleItemModel : TXBasicItemModel

@property (copy, nonatomic) NSString *subtitle;

- (instancetype)initClassType:(Class)cls Title:(NSString *)title subtitle:(NSString *)subtitle operation:(TXBasicItemOperation )operation;

+ (instancetype)subtitleItemWithclassType:(Class)cls Title:(NSString *)title subtitle:(NSString *)subtitle operation:(TXBasicItemOperation )operation;

@end
