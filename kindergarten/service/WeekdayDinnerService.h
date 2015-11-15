//
//  WeekdayDinnerService.h
//  kindergarten
//
//  Created by Scu_lbl on 15/6/6.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ResponseResult;
@interface WeekdayDinnerService : NSObject
- (ResponseResult*) getDinnerList;
- (ResponseResult*) getDinnerContent:(NSString*)url;
@end
