//
//  BabyShare.h
//  kindergarten
//
//  Created by Scu_lbl on 15/6/2.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BabyShare : NSObject
@property(nonatomic,copy) NSString* sid;
@property(nonatomic,copy) NSString* date;
@property(nonatomic,copy) NSString* babyId;
@property(nonatomic,copy) NSString* classId;
@property(nonatomic,copy) NSString* content;
@property(nonatomic,copy) NSString* msgId;

+(BabyShare*) initWithDictionary:(NSDictionary *)dic;
@end
