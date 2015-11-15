//
//  Channek.m
//  kindergarten
//
//  Created by Scu_lbl on 15/10/21.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "Channel.h"

@implementation Channel

+(Channel*) initWithDictionary:(NSDictionary *)dic{
    Channel *channel = [[Channel alloc] init];
    channel.channelId = [dic objectForKey:@"channelId"];
    channel.parentId = [dic objectForKey:@"parentId"];
    channel.name = [dic objectForKey:@"name"];
    channel.channelSn = [dic objectForKey:@"channelSn"];
    channel.channelUrl = [dic objectForKey:@"channelUrl"];
    channel.channelSort = [dic objectForKey:@"channelSort"];
    channel.channelDescription = [dic objectForKey:@"channelDescription"];
    return channel;
}
@end
