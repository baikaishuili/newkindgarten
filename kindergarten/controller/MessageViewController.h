//
//  MessageViewController.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/3.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *MessageTextView;
@property (weak, nonatomic) IBOutlet UITextField *telTextFeild;

- (IBAction)messageBtnClicked:(id)sender;
@end
