//
//  ViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/4/26.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "LoginViewController.h"
#import "HttpWork.h"
#import "ASIHTTPRequest.h"
#import "LoginService.h"
#import "User.h"
#import "MD5ParseString.h"
#import "ResponseResult.h"
#import "UserInstance.h"
#import "MenuViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *phoneNumber = [[NSUserDefaults standardUserDefaults]  stringForKey:@"userName"];
    NSString *password = [[NSUserDefaults standardUserDefaults]  stringForKey:@"password"];
    if (phoneNumber != nil) {
        self.numTextField.text = phoneNumber;
    }
    if (password != nil) {
        self.pwdTextField.text = password;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButton:(id)sender {

    NSString *phoneNumber = self.numTextField.text;
    NSString *password = self.pwdTextField.text;
    if (phoneNumber == nil || password == nil) {
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"请输入用户名和密码" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alter show];
        return;
    }
    User *user = [[User alloc] init];
    LoginService *loginService = [[LoginService alloc] init];
    user.phoneNumber = self.numTextField.text;
    //对密码进行MD5加密
    user.password = [MD5ParseString MD5:self.pwdTextField.text];
    ResponseResult *result = [loginService login:user];
    if (nil != result) {
        if ([result.info isEqualToString:@"SUCCESS"]) {
            [[NSUserDefaults standardUserDefaults] setObject:phoneNumber forKey:@"userName"];
            [[NSUserDefaults standardUserDefaults] setObject:password forKey:@"password"];
            User *resultUser = result.data;
            //将用户信息存在单例中，便于取用户信息
            [[UserInstance sharedUserInstance] setUserInstance:resultUser];
            //[self performSegueWithIdentifier:@"loginSegue" sender:self];
            if ([resultUser.role isEqualToString:@"parent"]) {
                MenuViewController *menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"menuViewControllerId"];
                self.navigationController.viewControllers = @[menuView];
                [self.navigationController pushViewController:menuView animated:YES];
            }else{
                MenuViewController *menuView = [self.storyboard instantiateViewControllerWithIdentifier:@"teacherMenuViewControllerId"];
                [self.navigationController popViewControllerAnimated:NO];
                [self.navigationController pushViewController:menuView animated:YES];
            }
            
        }else{
            UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示信息" message:result.message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alter show];
        }
    }else{
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"网络错误" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alter show];
    }

    NSLog(@"num---- pwd %@", result);
}

//点击屏幕空白处去掉键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.numTextField resignFirstResponder];
    [self.pwdTextField resignFirstResponder];
}

- (void)dealloc{
    NSLog(@"LoginViewController is dead");
}
@end
