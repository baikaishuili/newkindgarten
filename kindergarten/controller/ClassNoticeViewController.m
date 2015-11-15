//
//  ClassNoticeViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/3.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "ClassNoticeViewController.h"
#import "ClassNotice.h"
@interface ClassNoticeViewController ()

@end

@implementation ClassNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.noticeTableView.delegate = self;
    self.noticeTableView.dataSource = self;
    //[self.view addSubview:self.noticeTableView];
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

//返回每个section的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.noticeList count];
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
    
    UITableViewCell *result = nil;
    if( [tableView isEqual:self.noticeTableView]) {
        static NSString *cellIdentifier = @"Cells";
        result = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if( result == nil) {
            result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            
        }
        NSLog(@"setion %ld", (long)indexPath.row);
        ClassNotice *notice = (ClassNotice*)[self.noticeList objectAtIndex:(long)indexPath.row];
        result.textLabel.text = [NSString stringWithFormat:@"%@",notice.content];
    }
    
    return result;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClassNotice *notice = [self.noticeList objectAtIndex:[indexPath row]];
    NSString *content = notice.content;  //这个表示选中的那个cell上的数据
    NSString *title = [NSString stringWithFormat:@"通知详情(%@)", notice.date];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:content delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
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
