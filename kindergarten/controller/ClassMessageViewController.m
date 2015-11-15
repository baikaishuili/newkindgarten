//
//  classMessageViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/20.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "ClassMessageViewController.h"
#import "ClassMessage.h"
#import "User.h"
#import "UserInstance.h"
#import "Baby.h"
#import "ClassMessageService.h"
#import "ResponseResult.h"

@implementation ClassMessageViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.messageTextView.layer.borderColor = UIColor.grayColor.CGColor;
    self.messageTextView.layer.borderWidth = 2;
}

- (IBAction)messageBtnClicked:(id)sender {
    ClassMessage *message = [[ClassMessage alloc]init];
    message.content  = self.messageTextView.text;
    User *user = [[UserInstance sharedUserInstance] UserInstance];
    //message.babyName = user.baby.name;
    //message.babyId = user.baby.bid;
    //message.classId = user.baby.classId;
    message.isUpload = @"true";
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    message.date = [dateFormatter stringFromDate:currentDate];
    ClassMessageService *service = [[ClassMessageService alloc]init];
    ResponseResult *result = [service saveClassMessage:message];
    if ([result.info isEqualToString:@"SUCCESS"] == true) {
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"密码修改成功" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alter show];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示信息" message:@"密码修改失败" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alter show];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
