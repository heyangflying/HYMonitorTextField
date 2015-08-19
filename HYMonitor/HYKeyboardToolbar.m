//
//  HYKeyboardToolbar.m
//  HYMonitorTextField
//
//  Created by heyang on 15/8/19.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//

#import "HYKeyboardToolbar.h"

@implementation HYKeyboardToolbar


+ (instancetype)toolbar{
    //加载xib文件
    return [[[NSBundle mainBundle]loadNibNamed:@"HYKeyboardToolbar" owner:nil options:nil]lastObject];
}
- (IBAction)clickItemAction:(UIBarButtonItem *)sender {
    //判断被委托人是否实现相应方法
    if([self.hyKeyboardToolbarDelegate respondsToSelector:@selector(HYKeyboardToolbar:didClickItem:)]){
        
        [self.hyKeyboardToolbarDelegate HYKeyboardToolbar:self didClickItem:sender];
    }
}
@end
