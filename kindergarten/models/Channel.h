//
//  Channek.h
//  kindergarten
//
//  Created by Scu_lbl on 15/10/21.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Channel : NSObject

@property(nonatomic,copy) NSString* channelId;
@property(nonatomic,copy) NSString* parentId;
@property(nonatomic,copy) NSString* name;
@property(nonatomic,copy) NSString* channelSn;
@property(nonatomic,copy) NSString* channelUrl;
@property(nonatomic) Boolean* isDisplay;
@property(nonatomic,copy) NSString* channelSort;
@property(nonatomic,copy) NSString* channelDescription;

+(Channel*) initWithDictionary:(NSDictionary *)dic;
@end