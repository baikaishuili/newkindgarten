//
//  ClassNoticeService.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/3.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "ClassNoticeService.h"
#import "User.h"
#import "HttpWork.h"
#import "JSONKit.h"
#import "ClassRoom.h"
#import "ResponseResult.h"
#import "Baby.h"
#import "ClassNotice.h"

@implementation ClassNoticeService
-(ResponseResult*) classNotice:(User*) user{
    HttpWork *httpWork = [[HttpWork alloc] init];
    ResponseResult *result = nil;
    NSString *url = [NSString stringWithFormat:@"getClassNoticeByClaId"];
    url = [url stringByAppendingFormat:@"?ID=%@",[[user.baby objectAtIndex:0] classId]];
    NSString *response = [httpWork  sendRequestSync:url];
    
    if (nil != response) {
        result = [[ResponseResult alloc] init];
        //json嵌套的时候的设置
        NSDictionary  *resultsDictionary = [response objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
        
        result.info = [resultsDictionary valueForKey:@"info"];
        if ([result.info isEqualToString:@"SUCCESS"]) {
            NSArray *list = [[resultsDictionary objectForKey:@"LIST"] objectFromJSONString];
            NSMutableArray *noticeList = [NSMutableArray array];
                for (NSDictionary *str in list) {
                    [noticeList addObject:[ClassNotice initWithDictionary:str]];
                }
            result.data = noticeList;
        }else{
             result.message = [resultsDictionary valueForKey:@"MSG"];
        }
    }
    return result;
}
@end
