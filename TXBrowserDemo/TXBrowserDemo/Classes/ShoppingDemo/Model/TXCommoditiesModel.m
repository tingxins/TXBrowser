//
//  TXCommoditiesModel.m
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXCommoditiesModel.h"

@implementation TXCommoditiesModel

- (NSString *)imageUrl {
    if (_imageUrl) {
        return [@"http://m.360buyimg.com/mobilecms/" stringByAppendingString:_imageUrl];
    }
    return @"";
}

- (NSString *)num {
    if (_num) {
        return [@"数量：" stringByAppendingString:_num];
    }
    return @"";
}

- (NSString *)returnGoodsMsg {
    if (_returnGoodsMsg) {
        NSArray *msgs = [_returnGoodsMsg componentsSeparatedByString:@","];
        return msgs.lastObject;
    }
    return @"";
}

@end
