//
//  ClassRoom.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/2.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "ClassRoom.h"

@implementation ClassRoom

+(ClassRoom*) initWithDictionary:(NSDictionary *)dic{
    ClassRoom *room = [[ClassRoom alloc] init];
    room.rid = [dic valueForKey:@"roomId"];
    room.name = [dic valueForKey:@"roomUsername"];
    room.no = [dic valueForKey:@"roomNum"];
    room.password = [dic valueForKey:@"roomPass"];
    room.roomName = [dic valueForKey:@"roomName"];
    room.roomRemark = [dic valueForKey:@"roomRemark"];
    return room;
}
- (void)dealloc{
    NSLog(@"ClassRoom is dead");
}
@end
