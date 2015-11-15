//
//  Baby.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/2.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ClassRoom;
@interface Baby : NSObject
@property(nonatomic, copy) NSString* bid;
@property(nonatomic, copy) NSString* name;
@property(nonatomic, copy) NSString* birthday;
@property(nonatomic, copy) NSString* parentId;
@property(nonatomic, copy) NSString* classId; //班级Id
@property(nonatomic, copy) NSString* babyNike;
@property(nonatomic, copy) NSString* fatherName;
@property(nonatomic, copy) NSString* fatherTel;
@property(nonatomic, copy) NSString* motherName;
@property(nonatomic, copy) NSString* motherTel;
@property(nonatomic, copy) NSString* address;
@property(nonatomic, copy) NSString* postcode;
@property(nonatomic, copy) NSDate* entranceDate;
@property(nonatomic, copy) NSString* babyRemark;

@property(nonatomic) ClassRoom* classRoom;

- (NSDictionary*) dictionaryFromObject;
+(Baby*) initWithDictionary:(NSDictionary *)dic;
@end
