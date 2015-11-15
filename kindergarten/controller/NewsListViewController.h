//
//  NewsListViewController.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/23.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsListViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *newsTableView;
@property (strong,nonatomic) NSArray* newsList;
@end
