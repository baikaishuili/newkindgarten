//
//  GrowthFileViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/13.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "GrowthFileViewController.h"
#import "GrowthDetailViewController.h"

@interface GrowthFileViewController ()
{
    NSDate *mondayDate;
}
@end

@implementation GrowthFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Do any additional setup after loading the view.
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSArray * arrWeek=[NSArray arrayWithObjects:@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六", nil];
    NSDateComponents *dComponents = [calendar components:NSCalendarUnitWeekday fromDate:currentDate];
    int dayNum = [dComponents weekday]>2 ? [dComponents weekday] - 2 : 2 == [dComponents weekday] ? 0 : -1;
    mondayDate = [currentDate dateByAddingTimeInterval: - dayNum * 60 * 60 * 24];

    for (UIView *cell in self.view.subviews) {
        int index = cell.tag;
        //为uiview添加点击事件
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(timeViewClick:)];
        [cell addGestureRecognizer:tapGesture];
        for (UIView *label in cell.subviews) {
            if ([label isKindOfClass:[UILabel class]]) {
                UILabel *timeLabel = (UILabel*)label;
                if (timeLabel.tag == 0) {
                    [timeLabel setText:[arrWeek objectAtIndex:index]];
                }else if(timeLabel.tag == 1){
                    NSDate *temp = [mondayDate dateByAddingTimeInterval: index * 60 * 60 * 24];
                    [timeLabel setText:[dateFormatter stringFromDate:temp]];
                }
            }
           
        }
    }

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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)weekdaysBtnClicked:(id)sender {
    GrowthDetailViewController *detailView = [self.storyboard instantiateViewControllerWithIdentifier:@"growthDetailViewControllerId"];
    UIButton *button = sender;
    detailView.date = [mondayDate dateByAddingTimeInterval: button.tag * 60 * 60 * 24];
    [self.navigationController pushViewController:detailView animated:YES];
}

-(void)timeViewClick:(UITapGestureRecognizer *)gesture {
    GrowthDetailViewController *detailView = [self.storyboard instantiateViewControllerWithIdentifier:@"growthDetailViewControllerId"];
    UIView *view = gesture.view;
    detailView.date = [mondayDate dateByAddingTimeInterval: view.tag * 60 * 60 * 24];
    [self.navigationController pushViewController:detailView animated:YES];
}


@end
