//
//  TeacherMenuViewController.h
//  kindergarten
//
//  Created by Scu_lbl on 15/6/10.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassNoticeService.h"
#import "UserInstance.h"
#import "SystemInfo.h"
#import "VMSNetSDK.h"
#import "Prefix.h"
#import "ResourceTreeViewController.h"
#import "User.h"
#import "Baby.h"
#import "ClassRoom.h"
#import "ClassNoticeViewController.h"
#import "PhoneConnectionViewController.h"
#import "MessageViewController.h"
#import "AccountManagerViewController.h"
#import "GartenNewsViewController.h"
#import "GrowthFileViewController.h"
#import "Baby.h"
#import "PhoneConnectService.h"
#import "ResponseResult.h"

@interface TeacherMenuViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *photo;
//用于保存服务器信息
@property(nonatomic,retain)CMSPInfo *serverInfo;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UITableView *menuTableView;
//点击头像
-(void) photoClicked;
@end
