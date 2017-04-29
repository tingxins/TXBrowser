//
//  TXOrderViewController.m
//  TXBrowserDemo
//
//  Created by tingxins on 28/04/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#define HOST @"https://tingxins-test.firebaseio.com/"
#define REQUEST(url) [NSString stringWithFormat:@"%@%@", HOST, url]

#import "TXOrderViewController.h"
#import "MJExtension.h"

#import "TXItemGroupModel.h"
#import "TXBasicItemModel.h"
#import "TXAdditionalOrderModel.h"
#import "TXCouponModel.h"
#import "TXUsedJDBeanModel.h"

#import "TXAddressItemModel.h"
#import "TXAddressModel.h"

#import "TXCurrentOrderItemModel.h"
#import "TXCurrentOrderModel.h"

#import "TXDeliveryItemModel.h"
#import "TXDeliveryModel.h"

#import "TXAdditionalOrderItemModel.h"
#import "TXAdditionalOrderModel.h"

#import "TXBoldGrayLineItemModel.h"

#import "TXExtBuyAddressCell.h"
#import "TXExtBuyItemInfoCell.h"
#import "TXExtBuyDeliveryCell.h"
#import "TXExtBuyOperationCell.h"
#import "TXExtBuyBoldGrayLineCell.h"

@interface TXOrderViewController ()

@property (strong, nonatomic) NSArray *addressList;

@property (strong, nonatomic) TXCurrentOrderModel *currentOrderModel;

@property (strong, nonatomic) TXAdditionalOrderModel *additionalOrderModel;

@end

@implementation TXOrderViewController

- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupOrderInfos];
    
    [self sendRequest];
    
//    [self setupOrderDataSource];
}

- (void)setupOrderInfos {
    self.settingTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)sendRequest {
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    [self sendGetAddressByPinWithURLs:REQUEST(@"getAddressByPin.json") completionHandler:^(NSDictionary * _Nullable data, NSError * _Nullable error) {
        NSArray *addressList = [TXAddressModel mj_objectArrayWithKeyValuesArray:data[@"addressList"]];
        self.addressList = addressList;
        dispatch_group_leave(group);
    }];
    
    dispatch_group_enter(group);
    [self sendCurrentOrderWithURLs:REQUEST(@"currentOrder.json") completionHandler:^(NSDictionary * _Nullable data, NSError * _Nullable error) {
        TXCurrentOrderModel *currentOrderModel = [TXCurrentOrderModel mj_objectWithKeyValues:data];
        self.currentOrderModel = currentOrderModel;
        dispatch_group_leave(group);
    }];
    
    dispatch_group_enter(group);
    [self sendAdditionalOrderWithURLs:REQUEST(@"additionalOrder.json") completionHandler:^(NSDictionary * _Nullable data, NSError * _Nullable error) {
        TXAdditionalOrderModel *additionalOrderModel = [TXAdditionalOrderModel mj_objectWithKeyValues:data];
        self.additionalOrderModel = additionalOrderModel;
        dispatch_group_leave(group);
    }];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"OVER:%@", [NSThread currentThread]);
        [self setupOrderDataSource];
    });
}

- (void)setupOrderDataSource {
    
    /** 1.优先为 nib 文件注册 */
    [self registerNibWithClasses:@[[TXExtBuyAddressCell class], [TXExtBuyItemInfoCell class], [TXExtBuyDeliveryCell class], [TXExtBuyOperationCell class]]];
    
    [self addGroup0];
    
    [self.settingTableView reloadData];
}

- (void)addGroup0 {
    
    __weak typeof(self) weakSelf = self;
    /** 1 */
    TXAddressItemModel *addressItemModel = [TXAddressItemModel basicItemModelWithClassType:[TXExtBuyAddressCell class] title:@"地址信息" operation:^(TXBasicItemModel *currentModel) {
        NSLog(@"%@", currentModel.basicItemTitle);
    }];
    addressItemModel.addressModel = self.addressList.firstObject;
    
    /** 添加灰色分割线 */
    TXBoldGrayLineItemModel *grayLine0 = [self getBoldGrayLineItemModelWithOffsets:UIEdgeInsetsZero height:8];
    
    TXBoldGrayLineItemModel *filament0 = [self getBoldGrayLineItemModelWithOffsets:UIEdgeInsetsZero height:0.5];
    
    /** 2 */
    TXCurrentOrderItemModel *currentOrderItemModel = [TXCurrentOrderItemModel basicItemModelWithClassType:[TXExtBuyItemInfoCell class] title:@"商品信息" operation:^(TXBasicItemModel *currentModel) {
        NSLog(@"%@", currentModel.basicItemTitle);
    }];
    currentOrderItemModel.currentOrderModel = self.currentOrderModel;
    /** 额外响应事件 */
    [currentOrderItemModel configs:kDetailButtonEventTouchUpInside withBlock:^(id target, id response, TXBasicItemModel *currentModel) {
        NSLog(@"%@--点击详情", currentModel.basicItemTitle);
        [weakSelf showAlertWithTitle:@"商品信息" message:@"详情"];
    }];
    
    TXBoldGrayLineItemModel *filament1 = [self getBoldGrayLineItemModelWithOffsets:UIEdgeInsetsMake(0, 10, 0, 0) height:0.5];
    
    /** 3 */
    TXDeliveryItemModel *deliveryItemModel = [TXDeliveryItemModel basicItemModelWithClassType:[TXExtBuyDeliveryCell class] title:@"支付配送" operation:^(TXBasicItemModel *currentModel) {
        NSLog(@"%@", currentModel.basicItemTitle);
    }];
    deliveryItemModel.deliveryModel = self.currentOrderModel.deliveryModel;
    
    TXBoldGrayLineItemModel *filament2 = [self getBoldGrayLineItemModelWithOffsets:UIEdgeInsetsMake(0, 10, 0, 0) height:0.5];
    
    /** 4 */
    TXAdditionalOrderItemModel *billAdditionalOrderItemModel =  [TXAdditionalOrderItemModel basicItemModelWithClassType:[TXExtBuyOperationCell class] title:@"发票信息" operation:^(TXBasicItemModel *currentModel) {
        NSLog(@"%@", currentModel.basicItemTitle);
    }];
    billAdditionalOrderItemModel.subname = @"不开发票";// Just for demo
    billAdditionalOrderItemModel.additionalOrderModel = self.additionalOrderModel;
    
    /** 添加灰色细分割线 */
    TXBoldGrayLineItemModel *filament3 = [self getBoldGrayLineItemModelWithOffsets:UIEdgeInsetsZero height:0.5];
    
    /** 添加灰色粗分割线 */
    TXBoldGrayLineItemModel *grayLine1 = [self getBoldGrayLineItemModelWithOffsets:UIEdgeInsetsZero height:8];
    
    /** 5 */
    TXAdditionalOrderItemModel *couponAdditionalOrderItemModel =  [TXAdditionalOrderItemModel basicItemModelWithClassType:[TXExtBuyOperationCell class] title:@"优惠券" operation:^(TXBasicItemModel *currentModel) {
        NSLog(@"%@", currentModel.basicItemTitle);
    }];
    couponAdditionalOrderItemModel.subname = @"未使用";// Just for demo
    couponAdditionalOrderItemModel.additionalOrderModel = self.additionalOrderModel;
    
    TXBoldGrayLineItemModel *filament4 = [self getBoldGrayLineItemModelWithOffsets:UIEdgeInsetsMake(0, 10, 0, 0) height:0.5];
    
    /** 6 */
    TXAdditionalOrderItemModel *cardAdditionalOrderItemModel =  [TXAdditionalOrderItemModel basicItemModelWithClassType:[TXExtBuyOperationCell class] title:@"京东卡/E卡" operation:^(TXBasicItemModel *currentModel) {
        NSLog(@"%@", currentModel.basicItemTitle);
    }];
    cardAdditionalOrderItemModel.subname = @"无可用";// Just for demo
    cardAdditionalOrderItemModel.additionalOrderModel = self.additionalOrderModel;
    
    TXBoldGrayLineItemModel *filament5 = [self getBoldGrayLineItemModelWithOffsets:UIEdgeInsetsMake(0, 10, 0, 0) height:0.5];
    
    TXItemGroupModel *group0 = [TXItemGroupModel itemGroupModelWithGroupHeaderTitle:@"" groupFooterTitle:@"" groupMembers:@[addressItemModel, grayLine0, filament0, currentOrderItemModel, filament1, deliveryItemModel, filament2, billAdditionalOrderItemModel, filament3, grayLine1, couponAdditionalOrderItemModel, filament4, cardAdditionalOrderItemModel, filament5]];
    
    [self.dataSource removeAllObjects];
    [self.dataSource addObject:group0];
}

- (TXBoldGrayLineItemModel *)getBoldGrayLineItemModelWithOffsets:(UIEdgeInsets)offsets height:(CGFloat)height {
    
    /** 添加灰色分割线 */
    TXBoldGrayLineItemModel *grayLine = [TXBoldGrayLineItemModel basicItemModelWithClassType:[TXExtBuyBoldGrayLineCell class] title:@"灰色分割线" operation:^(TXBasicItemModel *currentModel) {
        NSLog(@"%@", currentModel.basicItemTitle);
    }];
    grayLine.offsets = offsets;
    grayLine.cellH = height;
    grayLine.notNib = YES;
    return grayLine;
}

- (void)sendGetAddressByPinWithURLs:(NSString *)URLs
                  completionHandler:(void(^)(NSDictionary * _Nullable data, NSError * _Nullable error))completionHandler {
    
    [self sendRequestWithURLs:URLs completionHandler:completionHandler];
}

- (void)sendCurrentOrderWithURLs:(NSString *)URLs
               completionHandler:(void(^)(NSDictionary * _Nullable data, NSError * _Nullable error))completionHandler {
    [self sendRequestWithURLs:URLs completionHandler:completionHandler];
}

- (void)sendAdditionalOrderWithURLs:(NSString *)URLs
                  completionHandler:(void(^)(NSDictionary * _Nullable data, NSError * _Nullable error))completionHandler {
    [self sendRequestWithURLs:URLs completionHandler:completionHandler];
}

- (void)sendRequestWithURLs:(NSString *)URLs
          completionHandler:(void(^)(NSDictionary * _Nullable data, NSError * _Nullable error))completionHandler {
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURL *url = [NSURL URLWithString:URLs];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(json, error);
        });
    }];
    [dataTask resume];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alertController animated:YES completion:^{
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
