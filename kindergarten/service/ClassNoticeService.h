//
//  ClassNoticeService.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/3.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ResponseResult;
@class User;

@interface ClassNoticeService : NSObject
-(ResponseResult*) classNotice:(User*) user;
@end
