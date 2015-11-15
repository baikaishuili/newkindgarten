//
//  Course.m
//  kindergarten
//
//  Created by Scu_lbl on 15/6/1.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "Course.h"

@implementation Course
+(Course*) initWithDictionary:(NSDictionary *)dic{
    Course *course = [[Course alloc] init];
    course.cid = [dic objectForKey:@"courseId"];
    course.date = [dic objectForKey:@"courseDate"];
    course.content = [dic objectForKey:@"courseContent"];
    course.classId = [dic objectForKey:@"classId"];
    course.type = [dic objectForKey:@"courseType"];
    course.period = [dic objectForKey:@"coursePeriod"];
    return course;
}
@end
