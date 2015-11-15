//
//  MessageViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/3.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageService.h"
#import "User.h"
#import "UserInstance.h"
#import "LeaveMessage.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.MessageTextView.layer.borderColor = UIColor.grayColor.CGColor;
    self.MessageTextView.layer.borderWidth = 2;
    
    User *user = [[UserInstance sharedUserInstance] UserInstance];
    self.telTextFeild.text = user.phoneNumber;
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)messageBtnClicked:(id)sender {
    LeaveMessage *message = [[LeaveMessage alloc] init];
    message.content = self.MessageTextView.text;
    NSLog(@"message is %@",self.MessageTextView.text);
    message.phone = self.telTextFeild.text;
    User *user = [[UserInstance sharedUserInstance] UserInstance];
    message.userId = user.uid;
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    message.date = [formatter stringFromDate:[NSDate date]];
    MessageService *messageService = [[MessageService alloc] init];
    ResponseResult *result = [messageService leaveMessage:message];
    if ([result.info isEqualToString:@"SUCCESS"] ) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"留言成功" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"留言失败" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}
@end
