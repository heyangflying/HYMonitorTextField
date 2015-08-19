//
//  HYMonitorTextField.h
//  HYMonitorTextField
//
//  Created by heyang on 15/8/19.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol HYKeyboardDelegate <NSObject>



@end

@interface HYMonitorTextField : NSObject

/**
 *
 * @brief  //初始化
 *
 * @param view 作用于那个view
 *
 * @return 返回实例
 */
+ (instancetype)monitorWithView:(UIView *)view;


/**
 *
 * @brief  键盘出来时调用此方法
 *
 * @param notifi 键盘显示通知
 * @param distance 文本框与键盘之间的间距
 */
- (void)keyboardShow:(NSNotification *)notifi andkeyboardSpacing:(int)spacing;


/**
 *
 * @brief  键盘隐藏时调用此方法
 */
- (void)keyboardHide;


@end
