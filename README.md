
# HYMonitorTextField

解决键盘遮挡TextField问题

使用方法:
拖入文件到工程中: < HYMonitor >



需要用到的控制器中:

@property (strong,nonatomic) HYMonitorTextField *hyMonitor;



self.hyMonitor =  [HYMonitorTextField monitorWithView:self.view];
    
    //监听键盘事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
    

}

//键盘显示时调用



-(void)keyboardWillShow:(NSNotification *)notifi{
    
    //第二个属性是文本框与键盘的间距
    
    [self.hyMonitor keyboardShow:notifi andkeyboardSpacing:10];
    
}

//键盘消失时调用



-(void)keyboardWillHide{

    [self.hyMonitor keyboardHide];
}


//取消编辑


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


        __   新手上路多多支持 ->     QQ: 285585804  __
                            
