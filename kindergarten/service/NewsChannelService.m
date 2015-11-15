//
//  NewsChannel.m
//  kindergarten
//
//  Created by Scu_lbl on 15/10/21.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "NewsChannelService.h"
#import "HttpWork.h"
#import "JSONKit.h"
#import "ResponseResult.h"
#import "Channel.h"
#import "ChannelNews.h"

@implementation NewsChannelService

- (ResponseResult*) getNewsChannel {
    HttpWork *httpWork = [[HttpWork alloc] init];
    ResponseResult *result = nil;
    NSString *url = [NSString stringWithFormat:@"getNewsChannel"];
    
    NSString *response = [httpWork sendRequestSync: url];
    
    if (nil != response) {
        result = [[ResponseResult alloc] init];
        //json嵌套的时候的设置
        NSDictionary  *resultsDictionary = [response objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
        
        result.info = [resultsDictionary valueForKey:@"info"];
        if ([result.info isEqualToString:@"SUCCESS"]) {
            NSArray *list = [[resultsDictionary objectForKey:@"LIST"] objectFromJSONString];
            NSMutableArray *channelList = [NSMutableArray array];
            for (NSDictionary *str in list) {
                [channelList addObject:[Channel initWithDictionary:str]];
            }
            result.data = channelList;
        }else{
            result.message = [resultsDictionary valueForKey:@"MSG"];
        }
    }
    return result;
}
- (ResponseResult*) getContentList:(NSString*) channelId pageNo:(int) pageNo pageSize:(int) pageSize{
    HttpWork *httpWork = [[HttpWork alloc] init];
    ResponseResult *result = nil;
    NSString *url = [NSString stringWithFormat:@"getContentList"];
    url = [url stringByAppendingFormat:@"?CHANNEL_ID=%@&PAGE_NO=%d&PAGE_SIZE=%d",channelId,pageNo,pageSize];
    NSString *response = [httpWork sendRequestSync: url];
    
    if (nil != response) {
        result = [[ResponseResult alloc] init];
        //json嵌套的时候的设置
        NSDictionary  *resultsDictionary = [response objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
        
        result.info = [resultsDictionary valueForKey:@"info"];
        if ([result.info isEqualToString:@"SUCCESS"]) {
            NSDictionary *dic = [[resultsDictionary objectForKey:@"PAGER"] objectFromJSONString];
            NSArray *list = [dic objectForKey:@"pageList"];
            NSMutableArray *channelList = [NSMutableArray array];
            for (NSDictionary *str in list) {
                [channelList addObject:[ChannelNews initWithDictionary:str]];
            }
            result.data = channelList;
        }else{
            result.message = [resultsDictionary valueForKey:@"MSG"];
        }
    }
    return result;
}
- (ResponseResult*) getContent:(NSString*) contentId{
    HttpWork *httpWork = [[HttpWork alloc] init];
    ResponseResult *result = nil;
    NSString *url = [NSString stringWithFormat:@"getContent"];
    url = [url stringByAppendingFormat:@"?CONTENT_ID=%@",contentId];
    NSString *response = [httpWork sendRequestSync: url];
    
    if (nil != response) {
        result = [[ResponseResult alloc] init];
        //json嵌套的时候的设置
        NSDictionary  *resultsDictionary = [response objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
        
        result.info = [resultsDictionary valueForKey:@"info"];
        if ([result.info isEqualToString:@"SUCCESS"]) {
            NSDictionary *dic = [[resultsDictionary objectForKey:@"CONTENT"] objectFromJSONString];
            NSString *content = [[dic objectForKey:@"contentTxt"]objectForKey:@"text"];
            result.data = content;
        }else{
            result.message = [resultsDictionary valueForKey:@"MSG"];
        }
    }
    return result;
}
@end
