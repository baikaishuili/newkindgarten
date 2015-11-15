//
//  HealthWatchViewController.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/23.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HealthWatchViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *healthWacthTextView;
@property (nonatomic, strong) NSArray* healthWacthList;
@end
