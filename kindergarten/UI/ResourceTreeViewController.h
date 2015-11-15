//
//  ResourceTreeViewController.h
//  IVMSDemo
//
//  Created by songqi on 15-4-7.
//  Copyright (c) 2015年 songqi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CMSPInfo;
@interface ResourceTreeViewController : UIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withServerInfo:(CMSPInfo *)serverInfo;

@end
