//
//  CourseViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/20.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "CourseViewController.h"
#import "Course.h"

@implementation CourseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.morningLabel.layer.borderColor = [UIColor colorWithRed:0.52 green:0.09 blue:0.07 alpha:1].CGColor;
    self.morningLabel.text = @"上\n\n午";
    self.morningLabel.numberOfLines = [self.morningLabel.text length];
    self.afternoonLabel.text = @"上\n\n午";
    self.afternoonLabel.numberOfLines = [self.afternoonLabel.text length];
    NSArray *courseLabels = [NSArray arrayWithObjects:self.course1Label,self.course2Label, self.course3Label,self.course4Label,self.course5Label,self.course6Label,nil];
    for (int i=0; i<self.courseList.count; i++) {
        Course *course = [self.courseList objectAtIndex:i];
        UILabel *label = [courseLabels objectAtIndex:[course.period intValue]];
        label.text = course.content;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
