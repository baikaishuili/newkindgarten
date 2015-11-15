//
//  ClassRoom.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/2.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassRoom : NSObject
@property(nonatomic, copy) NSString* rid;  // 教室Id；
@property(nonatomic, copy) NSString* no;  // room_no 字段意义不想
@property(nonatomic, copy) NSString* name;  // 教室名字；
@property(nonatomic, copy) NSString* password;
@property(nonatomic, copy) NSString* roomName;
@property(nonatomic, copy) NSString* roomRemark;

+(ClassRoom*) initWithDictionary:(NSDictionary *)dic;

@end
