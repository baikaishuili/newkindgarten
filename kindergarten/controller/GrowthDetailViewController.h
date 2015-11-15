//
//  GrowthDetailViewController.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/19.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GrowthDetailViewController : UIViewController
@property(nonatomic,retain)NSDate *date;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

- (IBAction)courseBtnClicked:(id)sender;
- (IBAction)healthWacthBtnClicked:(id)sender;
- (IBAction)classMessageBtnClicked:(id)sender;
- (IBAction)growthShareBtnclicked:(id)sender;


@end
