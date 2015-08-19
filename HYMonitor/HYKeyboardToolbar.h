//
//  HYKeyboardToolbar.h
//  HYMonitorTextField
//
//  Created by heyang on 15/8/19.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYKeyboardToolbar;

//声明按钮点击协议
@protocol HYKeyboardToolbarDelegate <NSObject>



/*
 *
 * @brief  根据item的tag值区分是哪一个按钮
 *
 * @param toolbar 当前工具条
 * @param item 工具条上的按钮
 */
- (void)HYKeyboardToolbar:(HYKeyboardToolbar *)toolbar didClickItem:(UIBarButtonItem *)item;

@end


@interface HYKeyboardToolbar : UIToolbar

@property (weak,nonatomic) id <HYKeyboardToolbarDelegate> hyKeyboardToolbarDelegate;



//初始化类方法
+ (instancetype)toolbar;


//上一个按钮
@property (weak, nonatomic) IBOutlet UIBarButtonItem *previousItem;

//下一个按钮
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextItem;

@end
