//
//  ClassMessageService.h
//  kindergarten
//
//  Created by Scu_lbl on 15/6/7.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ResponseResult;
@class ClassMessage;

@interface ClassMessageService : NSObject
- (ResponseResult*) saveClassMessage: (ClassMessage*) message;
@end
