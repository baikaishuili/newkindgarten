//
//  PhoneConnectionViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/18.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "PhoneConnectionViewController.h"
#import "User.h"

@implementation PhoneConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (int i=0; i<self.userList.count; i++) {
        int interval = i>0?2:0;
        CGRect frame = CGRectMake(0, 200+i*60+interval, 320, 60);
        UIButton *someAddButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        someAddButton.backgroundColor = [UIColor colorWithRed:125.0/255 green:206.0/255 blue:250.0/255 alpha:1];
        //[someAddButton.layer setBorderWidth:2];
        [someAddButton setTitle:[[self.userList objectAtIndex:i] name] forState:UIControlStateNormal];
        someAddButton.frame = frame;
        someAddButton.tag = i;
        [someAddButton addTarget:self action:@selector(someButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:someAddButton];
    }
//    for (int i=0; i<1; i++) {
//        int interval = i>0?2:0;
//        CGRect frame = CGRectMake(0, 200+i*60+interval, 320, 60);
//        UIButton *someAddButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        someAddButton.backgroundColor = [UIColor colorWithRed:125.0/255 green:206.0/255 blue:250.0/255 alpha:1];
//        //[someAddButton.layer setBorderWidth:2];
//        [someAddButton setTitle:@"test" forState:UIControlStateNormal];
//        someAddButton.frame = frame;
//        someAddButton.tag = i;
//        [someAddButton addTarget:self action:@selector(someButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:someAddButton];
//    }

}

//恢复导航条
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}


-(void) someButtonClicked:(id)sender {
    UIButton *button = (UIButton*)sender;
    NSString *phoneNumber = [NSString stringWithFormat:@"tel://%@",[[self.userList objectAtIndex:button.tag] phoneNumber]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
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
@end
