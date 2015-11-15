//
//  CourseViewController.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/20.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *morningLabel;
@property (nonatomic, strong) NSArray* courseList;
@property (weak, nonatomic) IBOutlet UILabel *course1Label;
@property (weak, nonatomic) IBOutlet UILabel *course2Label;
@property (weak, nonatomic) IBOutlet UILabel *course3Label;
@property (weak, nonatomic) IBOutlet UILabel *course4Label;
@property (weak, nonatomic) IBOutlet UILabel *course5Label;
@property (weak, nonatomic) IBOutlet UILabel *course6Label;
@property (weak, nonatomic) IBOutlet UILabel *afternoonLabel;
@end
