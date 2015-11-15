//
//  HttpWork.m
//  HelloWorld
//
//  Created by 李文科 on 15/3/16.
//  Copyright (c) 2015年 李文科. All rights reserved.
//

#import "HttpWork.h"
#import "ASIHTTPRequest.h"
#import "JSONKit.h"

@implementation HttpWork

static NSString *HOST_NAME = @"http://119.5.155.184:8089/Crown/appServices/";
- (NSString *)sendRequestSync:(NSString*)requestUrl
{
    NSString *response;
    NSString *url = [NSString stringWithString:HOST_NAME];
    url = [url stringByAppendingString:requestUrl];
    NSLog(@"request url is :%@", url);
    response = [self sendRequestSyncUrl:url];
    //NSURL *nsurl = [NSURL URLWithString:url];
    //ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:nsurl];
    //[request setRequestMethod:@"POST"];
    //[request setPostBody:tempJsonData];
//    request.defaultResponseEncoding = NSUTF8StringEncoding;
//    @try {
//         [request startSynchronous];
//    }
//    @catch (NSException *exception) {
//        NSLog(@"%@ %@", [exception name], [exception reason]);
//    }
//    NSError *error = [request error];
//    
//    if (!error) {
//        response = [request responseString];
//        NSLog(@"the content is %@",response);
//    }
    //截取字符串首尾的中括号，要不然解析出来位数组
    response = [response substringWithRange:NSMakeRange(1, response.length-2)];
    return response;
}

- (NSString *)sendRequestSync:(NSString*)requestUrl postBody:(NSData*) jsonData
{
    
    NSString *response;
    NSString *url = [NSString stringWithString:HOST_NAME];
    NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
    url = [url stringByAppendingString:requestUrl];
    NSLog(@"request url is :%@", url);
    NSLog(@"request url is :%@", tempJsonData);
    NSURL *nsurl = [NSURL URLWithString:url];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:nsurl];
    [request setDefaultResponseEncoding:NSUTF8StringEncoding];
    //[request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    [request addRequestHeader:@"Accept" value:@"application/json"];
    [request setRequestMethod:@"POST"];
    [request setPostBody:tempJsonData];
    [request startSynchronous];
    NSError *error1 = [request error];
    if (!error1) {
        response = [request responseString];
        NSLog(@"response：%@",response);
    }
    //截取字符串首尾的中括号，要不然解析出来位数组
    response = [response substringWithRange:NSMakeRange(1, response.length-2)];
    return response;
}

-(NSString *)sendRequestSyncUrl:(NSString*)url{
    NSString *response;
    NSLog(@"request url is :%@", url);
    NSURL *nsurl = [NSURL URLWithString:url];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:nsurl];
    [request setRequestMethod:@"POST"];
    request.defaultResponseEncoding = NSUTF8StringEncoding;
    @try {
        [request startSynchronous];
    }
    @catch (NSException *exception) {
        NSLog(@"%@ %@", [exception name], [exception reason]);
    }
    NSError *error = [request error];
    
    if (!error) {
        response = [request responseString];
        NSLog(@"the content is %@",response);
    }
    return response;
}

-(NSData *)sendRequestSyncUrlImg:(NSString*)url{
    NSData *response;
    NSLog(@"request url is :%@", url);
    NSURL *nsurl = [NSURL URLWithString:url];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:nsurl];

    @try {
        [request startSynchronous];
    }
    @catch (NSException *exception) {
        NSLog(@"%@ %@", [exception name], [exception reason]);
    }
    NSError *error = [request error];
    
    if (!error) {
        response = [request responseData];
        NSLog(@"the content is %@",response);
    }
    return response;
}

- (void)dealloc{
    NSLog(@"HttpWork is dead");
}
@end
