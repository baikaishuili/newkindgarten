//
//  ClassNotice.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/25.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassNotice : NSObject
@property(nonatomic,copy) NSString* nid;
@property(nonatomic,copy) NSString* date;
@property(nonatomic,copy) NSString* content;
@property(nonatomic,copy) NSString* teacherId;
@property(nonatomic,copy) NSString* classId;
@property(nonatomic,copy) NSString* checkedId;
@property(nonatomic,assign) int status;
+(ClassNotice*) initWithDictionary:(NSDictionary *)dic;
@end
