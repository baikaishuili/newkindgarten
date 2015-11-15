//
//  TeachInfoViewController.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/23.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeachInfoViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *teachInfoTabelView;

@end
