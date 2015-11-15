//
//  GrowShareViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/23.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "GrowthShareViewController.h"
#import "BabyShare.h"
@implementation GrowthShareViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.shareTextView.layer.borderColor = UIColor.grayColor.CGColor;
    self.shareTextView.layer.borderWidth = 2;
    NSString *content = @"";
    for (int i=0; i<self.babyShareList.count; i++) {
        NSString *temp = [[self.babyShareList objectAtIndex:i] content];
        content = [content stringByAppendingString:temp];
        content = [content stringByAppendingString:@"\n"];
    }
    self.shareTextView.text = content;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
