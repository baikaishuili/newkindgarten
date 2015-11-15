//
//  BabyShareService.h
//  kindergarten
//
//  Created by Scu_lbl on 15/6/2.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ResponseResult;
@interface BabyShareService : NSObject
- (ResponseResult*) getBabyShare: (NSString*) date babyId:(NSString*) babyId;
@end
