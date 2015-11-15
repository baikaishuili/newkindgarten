//
//  PhoneConnectService.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/24.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HttpWork;
@class ResponseResult;
@class Baby;

@interface PhoneConnectService : NSObject
- (ResponseResult*) getTeacherByBaby: (Baby*)baby;
@end
