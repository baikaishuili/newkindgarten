//
//  GartenNoticeService.h
//  kindergarten
//
//  Created by Scu_lbl on 15/6/6.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ResponseResult;

@interface GartenNoticeService : NSObject
- (ResponseResult*) getNoticeList;
- (ResponseResult*) getNoticeContent:(NSString*)url;
@end
