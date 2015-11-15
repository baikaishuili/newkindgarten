//
//  BabyShare.m
//  kindergarten
//
//  Created by Scu_lbl on 15/6/2.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "BabyShare.h"

@implementation BabyShare

+(BabyShare*) initWithDictionary:(NSDictionary *)dic{
    BabyShare *babyShare = [[BabyShare alloc] init];
    babyShare.sid = [dic objectForKey:@"babyShareId"];
    babyShare.date = [dic objectForKey:@"shareDate"];
    babyShare.content = [dic objectForKey:@"shareContent"];
    babyShare.classId = [dic objectForKey:@"classId"];
    babyShare.babyId = [dic objectForKey:@"babyId"];
    babyShare.msgId = [dic objectForKey:@"msgLibId"];
    return babyShare;
}
@end
