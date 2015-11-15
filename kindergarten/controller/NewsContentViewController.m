//
//  NewsContentViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/10/25.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "NewsContentViewController.h"

@implementation NewsContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.contentWebView loadHTMLString:self.content baseURL:nil];
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
@end
