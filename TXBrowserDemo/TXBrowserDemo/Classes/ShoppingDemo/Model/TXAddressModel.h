//
//  TXAddressModel.h
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TXAddressModel : NSObject
@property (nonatomic, assign) NSInteger City;
@property (nonatomic, strong) NSString * CityName;
@property (nonatomic, assign) NSInteger CoordType;
@property (nonatomic, strong) NSString * CountryName;
@property (nonatomic, assign) NSInteger County;
@property (nonatomic, strong) NSString * Email;
@property (nonatomic, assign) NSInteger IdField;
@property (nonatomic, assign) NSInteger IdArea;
@property (nonatomic, assign) NSInteger IdCity;
@property (nonatomic, assign) NSInteger IdProvince;
@property (nonatomic, assign) NSInteger IdTown;
@property (nonatomic, assign) CGFloat Latitude;
@property (nonatomic, assign) CGFloat Longitude;
@property (nonatomic, strong) NSString * MessageStr;
@property (nonatomic, strong) NSString * Mobile;
@property (nonatomic, strong) NSString * Name;
@property (nonatomic, strong) NSString * Phone;
@property (nonatomic, strong) NSString * Pin;
@property (nonatomic, assign) NSInteger Province;
@property (nonatomic, strong) NSString * ProvinceName;
@property (nonatomic, strong) NSString * TownName;
@property (nonatomic, assign) NSInteger TypeId;
@property (nonatomic, strong) NSString * Where;
@property (nonatomic, assign) BOOL addressDefault;
@property (nonatomic, strong) NSString * addressDetail;
@property (nonatomic, strong) NSString * areaExplainMsg;
@property (nonatomic, strong) NSString * areaExplainUrl;
@property (nonatomic, assign) BOOL isAreaWrong;
@property (nonatomic, assign) BOOL isIdTown;

@end
