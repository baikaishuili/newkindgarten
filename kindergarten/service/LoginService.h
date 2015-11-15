//
//  LoginService.h
//  kindergarten
//
//  Created by Scu_lbl on 15/4/29.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;
@class HttpWork;
@class ResponseResult;

@interface LoginService : NSObject

-(ResponseResult*) login:(User*) user;

-(ResponseResult*) logout:(User*) user;

@end
