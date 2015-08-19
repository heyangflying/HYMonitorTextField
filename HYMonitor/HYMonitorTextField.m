//
//  HYMonitorTextField.m
//  HYMonitorTextField
//
//  Created by heyang on 15/8/19.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//

#import "HYMonitorTextField.h"
#import "HYKeyboardToolbar.h"

@interface HYMonitorTextField()<HYKeyboardToolbarDelegate>

//用于保存输入框父视图
@property (nonatomic,strong) UIView *hyView;

//工具条
@property (nonatomic,strong) HYKeyboardToolbar *toolbar;

//存放所有输入框
@property (nonatomic,strong) NSMutableArray *fields;

@end


@implementation HYMonitorTextField

//
- (instancetype)initWithView:(UIView *)view
{
    if(self = [super init]){
        [self addFieldsFormFview:view];
    }
    return self;
}

//懒加载
- (HYKeyboardToolbar *)toolbar{
    
    if(!_toolbar){
        _toolbar = [HYKeyboardToolbar toolbar];
        _toolbar.hyKeyboardToolbarDelegate = self;
    }
    return _toolbar;
}

//输入框数组
- (NSMutableArray *)fields
{
    if(!_fields){
        _fields = [NSMutableArray array];
    }
    return  _fields;
}

+ (instancetype)monitorWithView:(UIView *)view{

    return   [[self alloc]initWithView:view];
}


- (void)addFieldsFormFview:(UIView *)view
{
   
    self.hyView = view;
  
    //遍历寻找有多少个输入框
    for (UIView *subView in self.hyView.subviews) {
        if([subView isKindOfClass:[UITextField class]]){
            UITextField *tf = (UITextField *)subView;
            
            //设置属性(显示键盘上的工具栏)
            tf.inputAccessoryView = self.toolbar;
            //tag区分 0 1 2 ...
            tf.tag = self.fields.count;
            //添加到数组
            [self.fields addObject:tf];
        }
        
    }
    
    
}
//键盘弹出来时调用
-(void)keyboardShow:(NSNotification *)notifi andkeyboardSpacing:(int)spacing
{
        //1.获取当前选中的UITextField在控制器view的最大Y值
    
        UITextField *currentTf = self.fields[[self indexOfFirstResponder]];
    
        //键盘一弹出，就判断上一个，下一个按钮可不可用
    
        if(currentTf.tag == 0){
            self.toolbar.previousItem.enabled = NO;
        }
    
        if(currentTf.tag == self.fields.count - 1){
            self.toolbar.nextItem.enabled = NO;
        }
    
        //currentTf.frame.origin.y +  currentTf.frame.size.height
        CGFloat maxY = CGRectGetMaxY(currentTf.frame) + self.hyView.frame.origin.y;
    
    
        //2.获取键盘的y值
        CGRect kbEndFrm = [notifi.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        CGFloat kbY = kbEndFrm.origin.y;
    
        //3.进行比较
    
        //计算距离
       __block CGFloat delta = kbY - maxY;
    
        if(delta < 0){//需要往上移
            //添加个动画
            [UIView animateWithDuration:0.25 animations:^{
 
                //间距
                if(spacing){
                    delta -= spacing;
                }
                self.hyView.transform = CGAffineTransformMakeTranslation(0, delta);
            }];
            
        }

}
//
- (void)keyboardHide{
    
    //视图还原
    [UIView animateWithDuration:0.25 animations:^{
        self.hyView.transform = CGAffineTransformIdentity;
    }];
    
    
    // 可点击
    self.toolbar.previousItem.enabled = YES;
    self.toolbar.nextItem.enabled = YES;

}

//获取当前的输入框的tag

-(NSInteger)indexOfFirstResponder{
    
    for (UITextField *tf in self.fields) {
        if (tf.isFirstResponder) {
            return tf.tag;
        }
    }
    //没有
    return -1;
}

-(void)HYKeyboardToolbar:(HYKeyboardToolbar *)toolbar didClickItem:(UIBarButtonItem *)item{
    
    switch (item.tag) {
        case 0://上一个
            [self previous];
            break;
        case 1://下一个
            [self next];
           
            break;
        case 2://完成
            [self.hyView endEditing:YES];
                break;
        default:
            break;
    }
}

-(void)previous{
    
    //获取当前第一响应者
    NSInteger currentIndex        = [self indexOfFirstResponder];

    self.toolbar.nextItem.enabled = YES;
    //获取上一个索引
    NSInteger previouesIndex      = currentIndex - 1;

    //放弃响应
    [self.fields[currentIndex] resignFirstResponder];

    //索引大于等0
    if (previouesIndex >= 0) {

        [self.fields[previouesIndex] becomeFirstResponder];
    }
    
}
-(void)next{
    
    NSInteger currentIndex            = [self indexOfFirstResponder];

    self.toolbar.previousItem.enabled = YES;

    [self.fields[currentIndex] resignFirstResponder];

    //设置下一个
    if (currentIndex != -1 && currentIndex != self.fields.count -1) {
        NSInteger nextIndex    = currentIndex + 1;
        [self.fields[nextIndex] becomeFirstResponder];
    }
    
}


@end
