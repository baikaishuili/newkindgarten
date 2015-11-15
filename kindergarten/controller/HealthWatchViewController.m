//
//  HealthWatchViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/23.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "HealthWatchViewController.h"
#import "HealthWatch.h"
@implementation HealthWatchViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.healthWacthTextView.layer.borderColor = UIColor.grayColor.CGColor;
    self.healthWacthTextView.layer.borderWidth = 2;
    NSString *content = @"";
    
    for (int i=0; i<self.healthWacthList.count; i++) {
        HealthWatch *healthWacth = [self.healthWacthList objectAtIndex:i];
        content = [content stringByAppendingString:@"食欲："];
        content = [content stringByAppendingString:healthWacth.appetite];
        content = [content stringByAppendingString:@"咳嗽："];
        content = [content stringByAppendingString:healthWacth.cough];
        content = [content stringByAppendingString:@"睡眠："];
        content = [content stringByAppendingString:healthWacth.sleep];
        content = [content stringByAppendingString:@"\n"];
        if (healthWacth.doDefecate) {
            content = [content stringByAppendingFormat:@"大便：是 上午：%d  中午：%d 下午 %d",healthWacth.defecateAm,healthWacth.defecateNoon,healthWacth.defecatePm];
        }else{
            content = [content stringByAppendingString:@"大便：否"];
        }
        content = [content stringByAppendingString:@"\n"];
                       
        if (healthWacth.doDefecate) {
           content = [content stringByAppendingFormat:@"服药：是 上午：%d  中午：%d 下午 %d",healthWacth.medicineAm,healthWacth.medicineNoon,healthWacth.medicinePm];
        }else{
            content = [content stringByAppendingString:@"服药：否"];
        }
                       
    }
    self.healthWacthTextView.text = content;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
