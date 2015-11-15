//
//  LeaveMessage.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/31.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "LeaveMessage.h"

@implementation LeaveMessage
- (NSDictionary*) dictionaryFromObject{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setValue:self.mid forKey:@"id"];
    [dictionary setValue:self.userId forKey:@"userId"];
    [dictionary setValue:self.phone forKey:@"phone"];
    [dictionary setValue:self.content forKey:@"leaveMsg"];
    [dictionary setValue:self.date forKey:@"msgDate"];
    return dictionary;
}
@end
