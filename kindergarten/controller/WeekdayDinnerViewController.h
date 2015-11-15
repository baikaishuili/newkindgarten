//
//  WeekdayDinnerViewController.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/23.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeekdayDinnerViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *dinnerTableView;
@property (strong,nonatomic) NSArray* dinnerList;
@end
