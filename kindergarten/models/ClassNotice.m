//
//  ClassNotice.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/25.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "ClassNotice.h"

@implementation ClassNotice

+(ClassNotice*) initWithDictionary:(NSDictionary *)dic{
    ClassNotice *notice = [[ClassNotice alloc] init];
    notice.nid = [dic objectForKey:@"noticeId"];
    notice.date = [[dic objectForKey:@"noticeDate"] substringWithRange:NSMakeRange(0, 10)];
    notice.content = [dic objectForKey:@"noticeContent"];
    notice.teacherId = [dic objectForKey:@"teacherId"];
    notice.classId = [dic objectForKey:@"classId"];
    notice.checkedId = [dic objectForKey:@"checkerId"];
    notice.status = [[dic objectForKey:@"noticeStatus"] intValue];
    notice.checkedId = [dic objectForKey:@"noticeRemark"];
    return notice;
}
@end
