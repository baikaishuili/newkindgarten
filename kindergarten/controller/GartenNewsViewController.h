//
//  GartenNewsViewController.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/12.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GartenNewsViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *channelTableView;
@property (nonatomic, strong) NSArray* channelList;
@end
