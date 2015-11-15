//
//  GrowthDetailViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/19.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "GrowthDetailViewController.h"
#import "CourseViewController.h"
#import "ClassMessageViewController.h"
#import "HealthWatchViewController.h"
#import "GrowthShareViewController.h"
#import "CourseService.h"
#import "User.h"
#import "Baby.h"
#import "UserInstance.h"
#import "ResponseResult.h"
#import "BabyShareService.h"
#import "HealthWacthService.h"

@implementation GrowthDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    self.dateLabel.text = [dateFormatter stringFromDate:self.date];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)courseBtnClicked:(id)sender {
    CourseService *courseService = [[CourseService alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    User *user = [[UserInstance sharedUserInstance] UserInstance];
    Baby *baby = [user.baby objectAtIndex:0];
    ResponseResult *result = [courseService getClassCourse:[dateFormatter stringFromDate:self.date] classId:baby.classId];
    CourseViewController *courseView = [self.storyboard instantiateViewControllerWithIdentifier:@"courseViewControllerId"];
    courseView.courseList = result.data;
    [self.navigationController pushViewController:courseView animated:YES];
}

- (IBAction)healthWacthBtnClicked:(id)sender {
    
    HealthWacthService *healthWacthService = [[HealthWacthService alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    User *user = [[UserInstance sharedUserInstance] UserInstance];
    Baby *baby = [user.baby objectAtIndex:0];
    ResponseResult *result = [healthWacthService getHealthWacth:[dateFormatter stringFromDate:self.date] babyId:baby.bid];
    HealthWatchViewController *healehWacthView = [self.storyboard instantiateViewControllerWithIdentifier:@"healthWatchViewControllerId"];
    healehWacthView.healthWacthList = result.data;
    [self.navigationController pushViewController:healehWacthView animated:YES];
}

- (IBAction)classMessageBtnClicked:(id)sender {
    ClassMessageViewController *messageView = [self.storyboard instantiateViewControllerWithIdentifier:@"classMessageViewControllerId"];
    [self.navigationController pushViewController:messageView animated:YES];
}

- (IBAction)growthShareBtnclicked:(id)sender {
    BabyShareService *babyShareService = [[BabyShareService alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    User *user = [[UserInstance sharedUserInstance] UserInstance];
    Baby *baby = [user.baby objectAtIndex:0];
    ResponseResult *result = [babyShareService getBabyShare:[dateFormatter stringFromDate:self.date] babyId:baby.bid];
    GrowthShareViewController *growthView = [self.storyboard instantiateViewControllerWithIdentifier:@"growthShareViewControllerId"];
    growthView.babyShareList = result.data;
    [self.navigationController pushViewController:growthView animated:YES];
}
@end
