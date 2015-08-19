//
//  HYViewController.m
//  HYMonitorTextField
//
//  Created by heyang on 15/8/19.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//

#import "HYViewController.h"
#import "HYMonitorTextField.h"

@interface HYViewController ()
@property (strong,nonatomic) HYMonitorTextField *hyMonitor;
@end

@implementation HYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.hyMonitor =  [HYMonitorTextField monitorWithView:self.view];
    
    //监听键盘事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
    

}
-(void)keyboardWillShow:(NSNotification *)notifi{
    
    //第二个属性是文本框与键盘的间距
    
    [self.hyMonitor keyboardShow:notifi andkeyboardSpacing:10];
    
}
-(void)keyboardWillHide{

    [self.hyMonitor keyboardHide];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
