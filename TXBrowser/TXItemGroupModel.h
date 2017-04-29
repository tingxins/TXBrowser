//
//  TXItemGroupModel.h
//  TXBrowser
//
//  Created by tingxins on 3/12/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TXItemGroupModel : NSObject

@property (copy, nonatomic) NSString *groupHeaderTitle;

@property (copy, nonatomic) NSString *groupFooterTitle;

@property (strong, nonatomic) NSArray *groupMembers;

- (instancetype) initItemGroupModelWithGroupHeaderTitle:(NSString *)groupHeaderTitle groupFooterTitle:(NSString *)groupFooterTitle groupMembers:(NSArray *)groupMembers;

+ (instancetype) itemGroupModelWithGroupHeaderTitle:(NSString *)groupHeaderTitle groupFooterTitle:(NSString *)groupFooterTitle groupMembers:(NSArray *)groupMembers;

@end
