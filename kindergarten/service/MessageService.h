//
//  MessageService.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/23.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseResult.h"
#import "LeaveMessage.h"
@interface MessageService : NSObject
-(ResponseResult*) leaveMessage:(LeaveMessage*) message;
@end
