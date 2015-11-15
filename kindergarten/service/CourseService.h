//
//  CourseService.h
//  kindergarten
//
//  Created by Scu_lbl on 15/6/1.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ResponseResult;
@interface CourseService : NSObject
- (ResponseResult*) getClassCourse: (NSString*) date classId:(NSString*) classId;
@end
