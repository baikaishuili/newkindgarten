//
//  MenuViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/4/26.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "MenuViewController.h"
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
#import "MenuTableViewCell.h"
#import "NewsChannelService.h"

@interface MenuViewController ()

@end

@implementation MenuViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuTableView.scrollEnabled = NO;
    NSData *imageData = [[NSUserDefaults standardUserDefaults]  dataForKey:PHOTO_IMAGE];
    if (nil != imageData) {
        UIImage *image = [UIImage imageWithData:imageData];
        self.photo.image = image;
    }
    self.photo.layer.masksToBounds = YES;
    [self.photo.layer setCornerRadius:CGRectGetHeight([self.photo bounds])*0.5];
    self.photo.layer.borderWidth = 2.0;
    self.photo.layer.borderColor = [UIColor grayColor].CGColor;
    //显示名字
    self.nameLabel.text = [[[[UserInstance sharedUserInstance] UserInstance].baby objectAtIndex:0] name];
    // Do any additional setup after loading the view.
    self.photo.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(photoClicked)];
    [self.photo addGestureRecognizer:singleTap];
    self.menuTableView.delegate = self;
    self.menuTableView.dataSource = self;
}


- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//头像选择
-(void) photoClicked {
    //实例化照片选择控制器
    UIImagePickerController *pickControl=[[UIImagePickerController alloc]init];
    //设置照片源
    [pickControl setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    //设置协议
    [pickControl setDelegate:self];
    //设置编辑
    [pickControl setAllowsEditing:YES];
    //选完图片之后回到的视图界面
    [self presentViewController:pickControl animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    //    UIImage *image=info[@"UIImagePickerControllerOriginalImage"];
    
    UIImage *image= [info objectForKey:@"UIImagePickerControllerEditedImage"];
    NSData *imageData = UIImageJPEGRepresentation(image, 100);
    [[NSUserDefaults standardUserDefaults] setObject: imageData forKey:PHOTO_IMAGE];
    [self.photo setImage:image];
    //选取完图片之后关闭视图
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//返回每个section的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

//返回section的数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return [NSString stringWithFormat:@""];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    static NSString *CellIdentifier = @"menuCell";
     MenuTableViewCell *cell = (MenuTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"MenuTableViewCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    }
    
    [[cell menuArrow] setImage:[UIImage imageNamed:@"jt.png"]];
    
    switch ([indexPath row]) {
        case 0:
            [[cell menuLabelView] setText:@"看宝贝"];
            [[cell menuImageView] setImage:[UIImage imageNamed:@"kbb.png"]];
            break;
        case 1:
            [[cell menuLabelView] setText:@"电话连线"];
            [[cell menuImageView] setImage:[UIImage imageNamed:@"dhlx.png"]];
            break;
        case 2:
            [[cell menuLabelView] setText:@"成长档案"];
            [[cell menuImageView] setImage:[UIImage imageNamed:@"czda.png"]];
            break;
        case 3:
            [[cell menuLabelView] setText:@"家长留言"];
            [[cell menuImageView] setImage:[UIImage imageNamed:@"jzly.png"]];
            break;
        case 4:
            [[cell menuLabelView] setText:@"通知公告"];
            [[cell menuImageView] setImage:[UIImage imageNamed:@"tzgg.png"]];
            break;
        case 5:
            [[cell menuLabelView] setText:@"园内新闻"];
            [[cell menuImageView] setImage:[UIImage imageNamed:@"ynxw.png"]];
            break;
        case 6:
            [[cell menuLabelView] setText:@"账号管理"];
            [[cell menuImageView] setImage:[UIImage imageNamed:@"zhgl.png"]];
            break;
        default:
            break;
    }

    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    switch ([indexPath row]) {
            //点击看宝贝
        case 0:
        {
            NSString *serverAddr = HAICON_HOST_NAME;
            serverAddr = [serverAddr uppercaseString];
            if(![serverAddr hasPrefix:@"HTTP://"])
            {
                serverAddr = [NSString stringWithFormat:@"HTTP://%@",serverAddr];
            }
            User *user = [[UserInstance sharedUserInstance] UserInstance];
            NSString *userName = [[user.baby objectAtIndex:0] classRoom].name;
            NSString *password = [[user.baby objectAtIndex:0] classRoom].password;
            VMSNetSDK * vmsNetSdk = [VMSNetSDK shareInstance] ;
            self.serverInfo = [[CMSPInfo alloc]init] ;
            BOOL ret = [vmsNetSdk login:serverAddr toUserName:userName toPassword:password toLineID:1 toServInfo:self.serverInfo];
            if(!ret)
            {
                //如果登录不上，可能是新6.x平台，再使用新平台登录方式登录
                ret = [vmsNetSdk loginV40:serverAddr toUserName:userName toPassword:password toServInfo:self.serverInfo];
                if(!ret)
                {
                    NSLog(@"login failed ! errno = %d",vmsNetSdk.nLastError);
                    return;
                }
            }
            [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d",vmsNetSdk.version] forKey:SERVER_VERSION];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            ResourceTreeViewController *treeViewController = [[ResourceTreeViewController alloc] initWithNibName:NSStringFromClass([ResourceTreeViewController class]) bundle:nil withServerInfo:self.serverInfo];
            //跳转到资源树列表
            [self.navigationController pushViewController:treeViewController animated:YES];
            break;
        }
            //电话联系
        case 1:
        {
            PhoneConnectService *service = [[PhoneConnectService alloc] init];
            Baby *baby = [[[UserInstance sharedUserInstance] UserInstance].baby objectAtIndex:0];
            ResponseResult *result = [service getTeacherByBaby:baby];
            NSArray *userList = [result data];
            PhoneConnectionViewController *connectionView = [self.storyboard instantiateViewControllerWithIdentifier:@"connectionViewControllerId"];
            connectionView.userList = userList;
            [self.navigationController pushViewController:connectionView animated:YES];
            break;
        }
            //成长档案
        case 2:
        {
            MessageViewController *messageView = [self.storyboard instantiateViewControllerWithIdentifier:@"growthFileViewControllerId"];
            [self.navigationController pushViewController:messageView animated:YES];
            break;
        }
            //家长留言
        case 3:
        {
            MessageViewController *messageView = [self.storyboard instantiateViewControllerWithIdentifier:@"messageViewControllerId"];
            [self.navigationController pushViewController:messageView animated:YES];
        
            break;
        }
            //通知公告
        case 4:
        {
            ClassNoticeService *classNoticeService = [[ClassNoticeService alloc] init];
            ResponseResult *result = [classNoticeService classNotice: [[UserInstance sharedUserInstance] UserInstance]];
            ClassNoticeViewController *noticeView = [self.storyboard instantiateViewControllerWithIdentifier:@"noticeViewControllerId"];
            noticeView.noticeList = result.data;
            [self.navigationController pushViewController:noticeView animated:YES];
            break;
        }
            //园内新闻
        case 5:
        {
            NewsChannelService *channelservice = [[NewsChannelService alloc] init];
            ResponseResult *result = [channelservice getNewsChannel];
            GartenNewsViewController *newsView = [self.storyboard instantiateViewControllerWithIdentifier:@"GartenNewsViewControllerId"];
            newsView.channelList = result.data;
            [self.navigationController pushViewController:newsView animated:YES];
       
            break;
        }
            //账号管理
        case 6:
        {
            AccountManagerViewController *accountManagerView = [self.storyboard instantiateViewControllerWithIdentifier:@"accountManagerViewControllerId"];
            [self.navigationController pushViewController:accountManagerView animated:YES];
            break;
        }
        default:
            break;
    }
//    ClassNotice *notice = [self.noticeList objectAtIndex:[indexPath row]];
//    NSString *content = notice.content;  //这个表示选中的那个cell上的数据
//    NSString *title = [NSString stringWithFormat:@"通知详情(%@)", notice.date];
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:content delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    [alert show];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
 
    return 54;
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
 {
        NSString* msg = [[NSString alloc] initWithFormat:@"您按下的第%d个按钮！",buttonIndex];
        NSLog(@"%@",msg);
 }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
