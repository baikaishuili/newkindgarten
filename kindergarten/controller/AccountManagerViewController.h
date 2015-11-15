//
//  AccountManagerViewController.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/5.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountManagerViewController : UIViewController
- (IBAction)changePwdBtnClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *oldPwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *changePwdTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *confirmPwdTextField;
@end
