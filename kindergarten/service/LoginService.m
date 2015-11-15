//
//  LoginService.m
//  kindergarten
//
//  Created by Scu_lbl on 15/4/29.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "LoginService.h"
#import "User.h"
#import "HttpWork.h"
#import "MD5ParseString.h"
#import "JSONKit.h"
#import "Baby.h"
#import "ClassRoom.h"
#import "ResponseResult.h"

@implementation LoginService

-(ResponseResult*)login:(User *)user{
    HttpWork *httpWork = [[HttpWork alloc] init];
    ResponseResult *result = nil;
    NSString *url = [NSString stringWithFormat:@"login"];
    url = [url stringByAppendingFormat:@"?PHONE=%@&PASSWORD=%@",user.phoneNumber,user.password];
    NSString *response = [httpWork  sendRequestSync:url];

    if (nil != response) {
        result = [[ResponseResult alloc] init];
        //json嵌套的时候的设置
        NSDictionary  *resultsDictionary = [response objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];

        result.info = [resultsDictionary valueForKey:@"info"];

        if ([result.info isEqualToString:@"SUCCESS"]) {
            //用户信息
            NSDictionary* userDictionary = [[resultsDictionary objectForKey:@"USER"] objectFromJSONString];
            user = [User initWithDictionary:userDictionary];
            if ([user.role isEqualToString:@"parent"]) {
                
                //将classroom转换成dictionary
                NSDictionary* classRoomDictionary = [[resultsDictionary objectForKey:@"CLASS_ROOM"] objectFromJSONString];
                ClassRoom *room = [ClassRoom initWithDictionary:classRoomDictionary];
                //解析出baby的字符串
                NSArray *list = [[resultsDictionary objectForKey:@"BABY"] objectFromJSONString];
                NSMutableArray *babyList = [NSMutableArray array];
                for (NSDictionary *str in list) {
                    Baby *baby = [Baby initWithDictionary:str];
                    baby.classRoom = room;
                    [babyList addObject:baby];
                }
                user.baby = babyList;
                result.data = user;
            }else if ([user.role isEqualToString:@"teacher"]){
                //将classroom转换成dictionary
                NSDictionary* classRoomDictionary = [[resultsDictionary objectForKey:@"CLASS_ROOM"] objectFromJSONString];
                ClassRoom *room = [ClassRoom initWithDictionary:classRoomDictionary];
                
                //解析出baby的字符串
                NSArray *list = [[resultsDictionary objectForKey:@"BABY"] objectFromJSONString];
                NSMutableArray *babyList = [NSMutableArray array];
                for (NSDictionary *str in list) {
                    Baby *baby = [Baby initWithDictionary:str];
                    baby.classRoom = room;
                    [babyList addObject:baby];
                }
                user.baby = babyList;
                result.data = user;
            }

        }else{
            result.message = [resultsDictionary valueForKey:@"MSG"];
        }
    }

    return result;
}

-(ResponseResult*) logout:(User*) user{
    HttpWork *httpWork = [[HttpWork alloc] init];
    ResponseResult *result = nil;
    NSString *url = [NSString stringWithFormat:@"changePwd"];
    NSDictionary *userDic = [user dictionaryFromObject];
    NSData *jsonData = [userDic JSONData];
    NSString *response = [httpWork sendRequestSync: url postBody: jsonData];
    
    if (nil != response) {
        result = [[ResponseResult alloc] init];
        //json嵌套的时候的设置
        NSDictionary  *resultsDictionary = [response objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
        
        result.info = [resultsDictionary valueForKey:@"info"];
    }
    return result;

}


- (void)dealloc{
    NSLog(@"LoginService is dead");
}
@end
