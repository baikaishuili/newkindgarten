//
//  AccountManagerViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/5.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "AccountManagerViewController.h"
#import "User.h"
#import "MD5ParseString.h"
#import "UserInstance.h"
#import "LoginService.h"
#import "ResponseResult.h"
@interface AccountManagerViewController ()

@end

@implementation AccountManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//恢复导航条
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changePwdBtnClicked:(id)sender {
    NSString *oldPwd = self.oldPwdTextField.text;
    NSString *changePwd = self.changePwdTextFiled.text;
    NSString *confirmPwd = self.confirmPwdTextField.text;

    if ([changePwd isEqualToString:confirmPwd]==false) {
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"确认密码与修改密码不一致" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alter show];
        return;
    }else{
        LoginService *loginService = [[LoginService alloc] init];
        User *user = [[UserInstance sharedUserInstance] UserInstance];
        user.password = [MD5ParseString MD5:self.changePwdTextFiled.text];
        ResponseResult *result = [loginService logout:user];
        if ([result.info isEqualToString:@"SUCCESS"] == true) {
            UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"密码修改成功" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alter show];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"密码修改失败" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alter show];
        }
    }
}

//点击屏幕空白处去掉键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.oldPwdTextField resignFirstResponder];
    [self.changePwdTextFiled resignFirstResponder];
    [self.confirmPwdTextField resignFirstResponder];
}
@end
