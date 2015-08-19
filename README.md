# HYMonitorTextField
解决键盘遮挡TextField问题

使用方法:
导入文件到工程中: HYMonitorTextField.h / HYMonitorTextField.m / HYKeyboardToolbar.h / HYKeyboardToolbar.m / HYKeyboardToolbar.xib



需要用到的控制器中:

@property (strong,nonatomic) HYMonitorTextField *hyMonitor;



self.hyMonitor =  [HYMonitorTextField monitorWithView:self.view];
    
    //监听键盘事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
    

}
-(void)keyboardWillShow:(NSNotification *)notifi{
    
    [self.hyMonitor show:notifi];
}
-(void)keyboardWillHide{

    [self.hyMonitor hide];
}




