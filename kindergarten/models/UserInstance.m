//
//  UserInstance.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/2.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//


#import "UserInstance.h"
static UserInstance *singleton = nil;
static User *user = nil;
@implementation UserInstance

+(UserInstance *)sharedUserInstance{
    
    @synchronized(self){  //为了确保多线程情况下，仍然确保实体的唯一性
        
        if (!singleton) {
            [[self alloc] init]; //该方法会调用 allocWithZone
        }
    }
    return singleton;
}

-(void)setUserInstance:(User*)newUser{
    user = newUser;
}

-(User*)UserInstance{
    return user;
}

+(id)allocWithZone:(NSZone *)zone{
    
    @synchronized(self){
        
        if (!singleton) {
            singleton = [super allocWithZone:zone]; //确保使用同一块内存地址
            return singleton;
        }
        
    }
    
    return singleton;
}

- (id)copyWithZone:(NSZone *)zone;{
    return self; //确保copy对象也是唯一
}

@end
