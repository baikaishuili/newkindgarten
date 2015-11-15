//
//  HttpWork.h
//  HelloWorld
//
//  Created by 李文科 on 15/3/16.
//  Copyright (c) 2015年 李文科. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpWork : NSObject

- (NSString *)sendRequestSync:(NSString*)requestUrl;
- (NSString *)sendRequestSync:(NSString*)requestUrl postBody:(NSData*) bodyArray;
- (NSString *)sendRequestSyncUrl:(NSString*)url;
- (NSData *)sendRequestSyncUrlImg:(NSString*)url;
@end
