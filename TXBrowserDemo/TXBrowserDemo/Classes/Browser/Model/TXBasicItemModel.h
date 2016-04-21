//
//  TXBasicItemModel.h
//  TXBrowser
//
//  Created by tingxins on 3/12/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

typedef void(^TXBasicItemOperation)();
#import <Foundation/Foundation.h>

@interface TXBasicItemModel : NSObject
/** 展示的cell */
@property (assign, nonatomic) Class basicClassType;
/** cell标题 */
@property (copy, nonatomic) NSString *basicItemTitle;
/** 点击cell相关操作 */
@property (copy, nonatomic) TXBasicItemOperation operation;

- (instancetype)initBasicItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle operation:(TXBasicItemOperation )operation;

+ (instancetype)basicItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle operation:(TXBasicItemOperation )operation;

@end
