//
//  HealthWacthService.m
//  kindergarten
//
//  Created by Scu_lbl on 15/6/3.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "HealthWacthService.h"
#import "HttpWork.h"
#import "JSONKit.h"
#import "ResponseResult.h"
#import "HealthWatch.h"

@implementation HealthWacthService
- (ResponseResult*) getHealthWacth: (NSString*) date babyId:(NSString*) babyId{
    HttpWork *httpWork = [[HttpWork alloc] init];
    ResponseResult *result = nil;
    NSString *url = [NSString stringWithFormat:@"getHWByDateAndBabyID"];
    url = [url stringByAppendingFormat:@"?DATE=%@&BABY_ID=%@",date,babyId];
    
    NSString *response = [httpWork sendRequestSync: url];
    
    if (nil != response) {
        result = [[ResponseResult alloc] init];
        //json嵌套的时候的设置
        NSDictionary  *resultsDictionary = [response objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
        
        result.info = [resultsDictionary valueForKey:@"info"];
        if ([result.info isEqualToString:@"SUCCESS"]) {
            NSArray *list = [[resultsDictionary objectForKey:@"LIST"] objectFromJSONString];
            NSMutableArray *healthWacthList = [NSMutableArray array];
            for (NSDictionary *str in list) {
                [healthWacthList addObject:[HealthWatch initWithDictionary:str]];
            }
            result.data = healthWacthList;
        }else{
            result.message = [resultsDictionary valueForKey:@"MSG"];
        }
    }
    return result;
}
@end
