//
//  PhoneConnectService.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/24.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "PhoneConnectService.h"
#import "HttpWork.h"
#import "JSONKit.h"
#import "Baby.h"
#import "ResponseResult.h"
#import "User.h"


@implementation PhoneConnectService

- (ResponseResult*) getTeacherByBaby: (Baby*)baby{
    HttpWork *httpWork = [[HttpWork alloc] init];
    ResponseResult *result = nil;
    NSString *url = [NSString stringWithFormat:@"getTeacherByBaby"];
    NSDictionary *babyDic = [baby dictionaryFromObject];
    NSArray *jsonArray = [NSArray arrayWithObject:babyDic];
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
                [userList addObject:[User initWithDictionary:str]];
            }
            result.data = userList;
        }else{
            result.message = [resultsDictionary valueForKey:@"MSG"];
        }
    }
    return result;
}
@end
