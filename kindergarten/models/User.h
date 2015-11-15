//
//  User.h
//  kindergarten
//
//  Created by Scu_lbl on 15/4/29.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Baby;
@interface User : NSObject
@property(nonatomic,copy) NSString* uid;
@property(nonatomic,copy) NSString* name;   //姓名
@property(nonatomic,copy) NSString* password;
@property(nonatomic,copy) NSString* role;   //用户角色
@property(nonatomic,copy) NSString* phoneNumber;   //电话号码
@property(nonatomic,copy) NSString* isable; //
@property(nonatomic,copy) NSString* userRemark; //
@property(nonatomic, strong) NSMutableArray* baby;

+(User*) initWithDictionary:(NSDictionary *)dic;

- (NSDictionary*) dictionaryFromObject;
@end
