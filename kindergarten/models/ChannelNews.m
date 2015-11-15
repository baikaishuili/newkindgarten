//
//  ChannelNews.m
//  kindergarten
//
//  Created by Scu_lbl on 15/10/21.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "ChannelNews.h"

@implementation ChannelNews

+(ChannelNews*) initWithDictionary:(NSDictionary *)dic{
    ChannelNews *channel = [[ChannelNews alloc] init];
    channel.channelId = [dic objectForKey:@"channelId"];
    channel.contentId = [dic objectForKey:@"contentId"];
    channel.cuserId = [dic objectForKey:@"cuserId"];
    channel.contentTitle = [dic objectForKey:@"contentTitle"];
    channel.contentDate = [dic objectForKey:@"contentDate"];
    channel.viewTimes = [dic objectForKey:@"viewTimes"];
    channel.contentOrigin = [dic objectForKey:@"contentOrigin"];
    channel.contentTxt = [dic objectForKey:@"contentTxt"];
    return channel;
}
@end
