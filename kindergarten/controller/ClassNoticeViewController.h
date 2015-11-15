//
//  ClassNoticeViewController.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/3.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassNoticeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *noticeTableView;
@property (nonatomic, strong) NSArray* noticeList;
@end
