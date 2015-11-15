//
//  WeekdayDinnerService.m
//  kindergarten
//
//  Created by Scu_lbl on 15/6/6.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "WeekdayDinnerService.h"
#import "HttpWork.h"
#import "TFHpple.h"
#import "TFHppleElement.h"
#import "XPathQuery.h"
#import "ResponseResult.h"
#import "WeekdayDinner.h"

@implementation WeekdayDinnerService

- (ResponseResult*) getDinnerList{
    HttpWork *httpwork = [[HttpWork alloc] init];
    ResponseResult *result = [[ResponseResult alloc] init];
    NSMutableArray *dinnerList = [NSMutableArray array];
    NSString *string = [httpwork sendRequestSyncUrl:@"http://www.crownyey.com/Article.aspx?mid=70"];
    NSData *htmlData = [string dataUsingEncoding:NSUTF8StringEncoding];
    TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:htmlData];
    NSArray *aArray = [xpathParser searchWithXPathQuery:@"//table"];
    
    if ([aArray count] > 0) {
        TFHppleElement *aElement = [aArray objectAtIndex:12];
        NSArray *tdArray = [aElement searchWithXPathQuery:@"//td"];
        
        for (int i = 0; i < tdArray.count; i=i+2) {
            WeekdayDinner *dinner = [[WeekdayDinner alloc] init];
            dinner.title = [[tdArray objectAtIndex:i] content];
            dinner.date = [[tdArray objectAtIndex:i+1] content];
            NSArray *aChildren = [[tdArray objectAtIndex:i] searchWithXPathQuery:@"//a"];
            NSDictionary *aAttributeDict = [[aChildren objectAtIndex:0] attributes];
            dinner.url = [aAttributeDict objectForKey:@"href"];
            [dinnerList addObject:dinner];
        }
        
    }
    result.data = dinnerList;
    return result;
}

- (ResponseResult*) getDinnerContent:(NSString*)url{
    
    HttpWork *httpwork = [[HttpWork alloc] init];
    ResponseResult *result = [[ResponseResult alloc] init];
    NSString *baseUrl = @"http://www.crownyey.com/";
    NSString *requestUrl = [baseUrl stringByAppendingString:url];
    NSString *string = [httpwork sendRequestSyncUrl:requestUrl];
    NSData *htmlData = [string dataUsingEncoding:NSUTF8StringEncoding];
    TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:htmlData];
    NSArray *aArray = [xpathParser searchWithXPathQuery:@"//img"];
    TFHppleElement *aElement = [aArray objectAtIndex:24];
    NSDictionary *aAttributeDict = [aElement attributes];
    NSString *src = [aAttributeDict objectForKey:@"src"];
    src = [baseUrl stringByAppendingString:src];
    NSData *imgData = [httpwork sendRequestSyncUrlImg:src];
    result.data = imgData;
    return result;
}
@end
