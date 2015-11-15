//
//  NewsListViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/23.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "NewsListViewController.h"
#import "GartenNoticeService.h"
#import "ResponseResult.h"
#import "ChannelNews.h"
#import "NoticeDetailViewController.h"
#import "NewsListTableViewCell.h"
#import "NewsChannelService.h"
#import "NewsContentViewController.h"

@interface NewsListViewController ()

@end

@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.newsTableView.delegate = self;
    self.newsTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//返回每个section的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.newsList.count;
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
    
    static NSString *cellIdentifier = @"newsListCell";

    NewsListTableViewCell *cell = (NewsListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"NewsListTableViewCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    }
    
    [[cell newsTitleLabelView] setText:[[self.newsList objectAtIndex:indexPath.row] contentTitle]];
    [[cell newsDateLabelView] setText:[[self.newsList objectAtIndex:indexPath.row] contentDate]];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChannelNews *news = [self.newsList objectAtIndex:[indexPath row]];
    NewsChannelService *channelservice = [[NewsChannelService alloc] init];
    ResponseResult *result = [channelservice getContent:news.contentId];
    
    NewsContentViewController *contentView = [self.storyboard instantiateViewControllerWithIdentifier:@"newsContentViewControllerId"];
    contentView.content = result.data;
    [self.navigationController pushViewController:contentView animated:YES];
    
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
