//
//  TXCommon.h
//  TXBrowserDemo
//
//  Created by tingxins on 3/11/16.
//  Copyright © 2016 TINGXINS. All rights reserved.
//

#ifndef TXCommon_h
#define TXCommon_h
/** iPhone 5S 的尺寸比例 **/
#define TXStandardHeight 568
#define TXStandardWidth 320
#define TXStandardForHeight(a) ([UIScreen mainScreen].bounds.size.height * a) / TXStandardHeight

#define TXStandardForWidth(a) ([UIScreen mainScreen].bounds.size.width * a) / TXStandardWidth
/** 调色板 **/
#define RGB(a, b, c) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:1]
/** 相关尺寸 **/
#define tB_FONT_FOR_TABBARBUTTON_TITLE [UIFont systemFontOfSize:12]
/** 设备尺寸 */
#define TXScreenSize [UIScreen mainScreen].bounds.size
/** 打印函数 **/
#ifdef DEBUG
#define TXLog(...) NSLog(__VA_ARGS__)
#else
#define TXLog(...)
#endif
#endif /* TXCommon_h */
