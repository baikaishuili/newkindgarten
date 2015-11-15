//
//  BabyShareService.m
//  kindergarten
//
//  Created by Scu_lbl on 15/6/2.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "BabyShareService.h"
#import "HttpWork.h"
#import "JSONKit.h"
#import "ResponseResult.h"
#import "BabyShare.h"

@implementation BabyShareService

- (ResponseResult*) getBabyShare: (NSString*) date babyId:(NSString*) babyId{
    HttpWork *httpWork = [[HttpWork alloc] init];
    ResponseResult *result = nil;
    NSString *url = [NSString stringWithFormat:@"getBabyShareServlet"];
    url = [url stringByAppendingFormat:@"?DATE=%@&BABY_ID=%@",date,babyId];
    
    NSString *response = [httpWork sendRequestSync: url];
    
    if (nil != response) {
        result = [[ResponseResult alloc] init];
        //json嵌套的时候的设置
        NSDictionary  *resultsDictionary = [response objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
        
        result.info = [resultsDictionary valueForKey:@"info"];
        if ([result.info isEqualToString:@"SUCCESS"]) {
            NSArray *list = [[resultsDictionary objectForKey:@"LIST"] objectFromJSONString];
            NSMutableArray *babyShareList = [NSMutableArray array];
            for (NSDictionary *str in list) {
                [babyShareList addObject:[BabyShare initWithDictionary:str]];
            }
            result.data = babyShareList;
        }else{
            result.message = [resultsDictionary valueForKey:@"MSG"];
        }
    }
    return result;
}
@end
