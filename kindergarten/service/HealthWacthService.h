//
//  HealthWacthService.h
//  kindergarten
//
//  Created by Scu_lbl on 15/6/3.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ResponseResult;

@interface HealthWacthService : NSObject
- (ResponseResult*) getHealthWacth: (NSString*) date babyId:(NSString*) babyId;
@end
