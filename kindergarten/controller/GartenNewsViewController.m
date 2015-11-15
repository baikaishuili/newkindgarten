//
//  GartenNewsViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/12.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "GartenNewsViewController.h"
#import "HttpWork.h"
#import "ChannelTableViewCell.h"
#import "Channel.h"
#import "NewsChannelService.h"
#import "NewsListViewController.h"
#import "ResponseResult.h"

@interface GartenNewsViewController ()

@end

@implementation GartenNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.channelTableView.scrollEnabled = NO;
    self.channelTableView.delegate = self;
    self.channelTableView.dataSource = self;
//    NSArray *items =  self.tabBar.items;
//    [[items objectAtIndex:0] setTitle:@"每周食谱"];
//    [[items objectAtIndex:0] setTag:1];
//    [[items objectAtIndex:0] setImage:[UIImage imageNamed:@"icon_dinner.png"]];
//
//    [[items objectAtIndex:1] setTitle:@"园内新闻"];
//    [[items objectAtIndex:1] setTag:2];
//    [[items objectAtIndex:1] setImage:[UIImage imageNamed:@"icon_garten_news.png"]];
//    
//    [[items objectAtIndex:2] setTitle:@"教研资讯"];
//    [[items objectAtIndex:2] setTag:3];
//    [[items objectAtIndex:2] setImage:[UIImage imageNamed:@"icon_teach_info.png"]];
    

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"channelCell";
    ChannelTableViewCell *cell = (ChannelTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"ChannelTableViewCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    }
    
    [[cell menuArrow] setImage:[UIImage imageNamed:@"jt.png"]];
    Channel *channel = [self.channelList objectAtIndex:[indexPath row]];
    
    [[cell menuLabelView] setText:channel.name];
    
    return cell;
    
}
//返回每个section的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    return self.channelList.count;

}

//返回section的数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    return 1;
}

//恢复导航条
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Channel *channel = [self.channelList objectAtIndex:[indexPath row]];
    NewsChannelService *channelservice = [[NewsChannelService alloc] init];
    ResponseResult *result = [channelservice getContentList:channel.channelId pageNo:0 pageSize:20];
    
    NewsListViewController *newsListView = [self.storyboard instantiateViewControllerWithIdentifier:@"newsListViewControllerId"];
    [newsListView setTitle:channel.name];
    newsListView.newsList = result.data;
    [self.navigationController pushViewController:newsListView animated:YES];
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
