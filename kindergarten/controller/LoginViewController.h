//
//  ViewController.h
//  kindergarten
//
//  Created by Scu_lbl on 15/4/26.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginService;
@class User;

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *numTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (nonatomic, strong) LoginService *loginService;
@property (nonatomic,strong) User *user;
- (IBAction)loginButton:(id)sender;

@end

