//
//  classMessageViewController.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/20.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassMessageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *messageTextView;
- (IBAction)messageBtnClicked:(id)sender;

@end
