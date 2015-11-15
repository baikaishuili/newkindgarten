//
//  GrowthFileViewController.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/13.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <UIKit/UIKit.h>
//成长档案类
@interface GrowthFileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *mondayBtn;
@property (weak, nonatomic) IBOutlet UIButton *tuesdayBtn;
@property (weak, nonatomic) IBOutlet UIButton *wednesdayBtn;
@property (weak, nonatomic) IBOutlet UIButton *thursdayBtn;
@property (weak, nonatomic) IBOutlet UIButton *fridayBtn;
- (IBAction)weekdaysBtnClicked:(id)sender;
-(void)timeViewClick:(id)sender;
@end
