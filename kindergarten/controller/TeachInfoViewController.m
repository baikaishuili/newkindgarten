//
//  TeachInfoViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/23.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "TeachInfoViewController.h"

@interface TeachInfoViewController ()

@end

@implementation TeachInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.teachInfoTabelView.delegate = self;
    self.teachInfoTabelView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//返回每个section的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
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
    if( [tableView isEqual:self.teachInfoTabelView]) {
        static NSString *cellIdentifier = @"Cells";
        result = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if( result == nil) {
            result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            
        }
        NSLog(@"setion %ld", (long)indexPath.row);
        
        result.textLabel.text = [NSString stringWithFormat:@"%@",@"无相关数据"];
    }
    
    return result;
    
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
