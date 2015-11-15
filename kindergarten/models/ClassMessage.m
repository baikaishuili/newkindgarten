//
//  ClassMessage.m
//  kindergarten
//
//  Created by Scu_lbl on 15/6/7.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "ClassMessage.h"

@implementation ClassMessage

- (NSDictionary*) dictionaryFromObject{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setValue:self.mid forKey:@"msgId"];
    [dictionary setValue:self.babyId forKey:@"babyId"];
    [dictionary setValue:self.classId forKey:@"claId"];
    [dictionary setValue:self.content forKey:@"leaveMsg"];
    [dictionary setValue:self.date forKey:@"msgDate"];
    [dictionary setValue:self.babyName forKey:@"babyName"];
    [dictionary setValue:self.replay forKey:@"replay"];
    [dictionary setValue:self.isUpload forKey:@"isUpload"];
    return dictionary;
}
@end
