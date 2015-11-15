//
//  Course.h
//  kindergarten
//
//  Created by Scu_lbl on 15/6/1.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Course : NSObject
@property(nonatomic,copy) NSString* cid;
@property(nonatomic,copy) NSString* classId;
@property(nonatomic,copy) NSString* date;
@property(nonatomic,copy) NSString* type;
@property(nonatomic,copy) NSString* content;
@property(nonatomic,copy) NSString* period;

+(Course*) initWithDictionary:(NSDictionary *)dic;
@end
