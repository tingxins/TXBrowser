//
//  TXItemGroupModel.m
//  TXBrowser
//
//  Created by tingxins on 3/12/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#import "TXItemGroupModel.h"

@implementation TXItemGroupModel

- (instancetype)initItemGroupModelWithGroupHeaderTitle:(NSString *)groupHeaderTitle groupFooterTitle:(NSString *)groupFooterTitle groupMembers:(NSArray *)groupMembers {
    if (self = [super init]) {
        self.groupHeaderTitle = groupHeaderTitle;
        self.groupFooterTitle = groupFooterTitle;
        self.groupMembers = groupMembers;
    }
    return self;
}

+ (instancetype)itemGroupModelWithGroupHeaderTitle:(NSString *)groupHeaderTitle groupFooterTitle:(NSString *)groupFooterTitle groupMembers:(NSArray *)groupMembers {
    return [[self alloc] initItemGroupModelWithGroupHeaderTitle:groupHeaderTitle groupFooterTitle:groupFooterTitle groupMembers:groupMembers];
}

@end
