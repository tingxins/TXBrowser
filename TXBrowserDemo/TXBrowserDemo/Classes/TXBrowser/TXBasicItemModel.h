//
//  TXBasicItemModel.h
//  TXBrowser
//
//  Created by tingxins on 3/12/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//  数据模型


#define HiddenPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//typedef void(^TXBasicItemBlock)(id target, id response);

@class TXBasicItemModel;

typedef void(^TXBasicItemBlock)(id target, id response, TXBasicItemModel *currentModel);

typedef void(^TXBasicItemOperation)(TXBasicItemModel *currentModel);

@interface TXBasicItemModel : NSObject

@property (assign, nonatomic) CGFloat cellH;
/** 展示的cell */
@property (assign, nonatomic) Class basicClassType;
/** cell标题 */
@property (copy, nonatomic) NSString *basicItemTitle;
/** 点击cell相关操作 */
@property (copy, nonatomic) TXBasicItemOperation operation;
/** 是否采用Nib */
@property (assign, nonatomic, getter=isNotNib) BOOL notNib;

- (instancetype)initBasicItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle operation:(TXBasicItemOperation )operation;

+ (instancetype)basicItemModelWithClassType:(Class)basicClassType title:(NSString *)basicItemTitle operation:(TXBasicItemOperation )operation;


#pragma mark - Runtime

/**
 Configs block for target.
 
 @param target target that you want to configs.
 @param block execute block.
 */
- (void)configs:(id)target withBlock:(TXBasicItemBlock)block;

/** return a block that configs before. */
- (TXBasicItemBlock)executeWithTarget:(id)target;

/**
 Configs sel for target.
 
 @param target target that you want to configs.
 @param response the objc that will execute sel.
 @param sel execute sel.
 */
- (void)configs:(id)target response:(id)response withSEL:(SEL)sel;

/** return a sel that configs before */
- (SEL)executeSELWithTarget:(id)target;

@end
