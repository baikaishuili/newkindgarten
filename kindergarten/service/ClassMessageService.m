//
//  ClassMessageService.m
//  kindergarten
//
//  Created by Scu_lbl on 15/6/7.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "ClassMessageService.h"
#import "ClassMessage.h"
#import "HttpWork.h"
#import "ResponseResult.h"
#import "JSONKit.h"

@implementation ClassMessageService

- (ResponseResult*) saveClassMessage: (ClassMessage*) message{
    HttpWork *httpWork = [[HttpWork alloc] init];
    ResponseResult *result = nil;
    NSString *url = [NSString stringWithFormat:@"getTeacherByBaby"];
    NSDictionary *messageDic = [message dictionaryFromObject];
    NSArray *jsonArray = [NSArray arrayWithObject:messageDic];
    NSData *jsonData = [jsonArray JSONData];
    NSString *response = [httpWork sendRequestSync: url postBody: jsonData];
    
    if (nil != response) {
        result = [[ResponseResult alloc] init];
        //json嵌套的时候的设置
        NSDictionary  *resultsDictionary = [response objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
        
        result.info = [resultsDictionary valueForKey:@"info"];
        if ([result.info isEqualToString:@"SUCCESS"]) {
            NSArray *list = [[resultsDictionary objectForKey:@"LIST"] objectFromJSONString];
            NSMutableArray *userList = [NSMutableArray array];
            for (NSDictionary *str in list) {
              //  [userList addObject:[User initWithDictionary:str]];
            }
            result.data = userList;
        }else{
            result.message = [resultsDictionary valueForKey:@"MSG"];
        }
    }
    return result;
}
@end
