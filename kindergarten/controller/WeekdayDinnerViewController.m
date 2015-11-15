//
//  WeekdayDinnerViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/23.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "WeekdayDinnerViewController.h"
#import "DinnerDetialViewController.h"
#import "WeekdayDinnerService.h"
#import "ResponseResult.h"
#import "WeekdayDinner.h"

@implementation WeekdayDinnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dinnerTableView.delegate = self;
    self.dinnerTableView.dataSource = self;
    WeekdayDinnerService *service = [[WeekdayDinnerService alloc]init];
    ResponseResult *result = [service getDinnerList];
    self.dinnerList = result.data;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//返回每个section的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dinnerList.count;
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
    if( [tableView isEqual:self.dinnerTableView]) {
        static NSString *cellIdentifier = @"Cells";
        result = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if( result == nil) {
            result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            
        }
        NSLog(@"setion %ld", (long)indexPath.row);
        
        result.textLabel.text = [NSString stringWithFormat:@"%@",[[self.dinnerList objectAtIndex:indexPath.row]title]];
    }
    
    return result;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeekdayDinner *dinner = [self.dinnerList objectAtIndex:[indexPath row]];
    NSLog(@"%@",dinner.url);  //这个表示选中的那个cell上的数据
    WeekdayDinnerService *service = [[WeekdayDinnerService alloc]init];
    ResponseResult *result = [service getDinnerContent:dinner.url];
    
    DinnerDetialViewController *dinnerDetialView = [self.storyboard instantiateViewControllerWithIdentifier:@"dinnerDetialViewControllerId"];
    dinnerDetialView.image = [UIImage imageWithData:result.data];
    [self.navigationController pushViewController:dinnerDetialView animated:YES];
    
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (IBAction)testBtnClicked:(id)sender {
    
    DinnerDetialViewController *dinnerView = [self.storyboard instantiateViewControllerWithIdentifier:@"dinnerDetialViewControllerId"];
    [self.navigationController pushViewController:dinnerView animated:YES];
}
@end
