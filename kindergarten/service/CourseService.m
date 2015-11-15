//
//  CourseService.m
//  kindergarten
//
//  Created by Scu_lbl on 15/6/1.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "CourseService.h"
#import "HttpWork.h"
#import "JSONKit.h"
#import "ResponseResult.h"
#import "Course.h"

@implementation CourseService

- (ResponseResult*) getClassCourse: (NSString*) date classId:(NSString*) classId{
    HttpWork *httpWork = [[HttpWork alloc] init];
    ResponseResult *result = nil;
    NSString *url = [NSString stringWithFormat:@"getCourse"];
    url = [url stringByAppendingFormat:@"?DATE=%@&CLA_ID=%@",date,classId];
 
    NSString *response = [httpWork sendRequestSync: url];
    
    if (nil != response) {
        result = [[ResponseResult alloc] init];
        //json嵌套的时候的设置
        NSDictionary  *resultsDictionary = [response objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
        
        result.info = [resultsDictionary valueForKey:@"info"];
        if ([result.info isEqualToString:@"SUCCESS"]) {
            NSArray *list = [[resultsDictionary objectForKey:@"COURSE_LIST"] objectFromJSONString];
            NSMutableArray *courseList = [NSMutableArray array];
            for (NSDictionary *str in list) {
                [courseList addObject:[Course initWithDictionary:str]];
            }
            result.data = courseList;
        }else{
            result.message = [resultsDictionary valueForKey:@"MSG"];
        }
    }
    return result;
}
@end
