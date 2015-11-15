//
//  NewsContentViewController.h
//  kindergarten
//
//  Created by Scu_lbl on 15/10/25.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *contentWebView;
@property(nonatomic,copy) NSString* content;
@end
