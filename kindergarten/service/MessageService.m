//
//  MessageService.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/23.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "MessageService.h"
#import "HttpWork.h"
#import "LeaveMessage.h"
#import "JSONKit.h"

@implementation MessageService
-(ResponseResult*) leaveMessage:(LeaveMessage*) message{
    HttpWork *httpWork = [[HttpWork alloc] init];
    ResponseResult *result = nil;
    NSString *url = [NSString stringWithFormat:@"createLeaveMsg"];
    //将对象转换成字典
    NSDictionary *messageDic = [message dictionaryFromObject];
    NSData *jsonData = [messageDic JSONData];
    NSString *response = [httpWork sendRequestSync: url postBody: jsonData];
    if (nil != response) {
        result = [[ResponseResult alloc] init];
        //json嵌套的时候的设置
        NSDictionary  *resultsDictionary = [response objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
        result.info = [resultsDictionary valueForKey:@"info"];
    }
    return result;
}
@end
