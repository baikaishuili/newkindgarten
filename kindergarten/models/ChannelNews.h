//
//  ChannelNews.h
//  kindergarten
//
//  Created by Scu_lbl on 15/10/21.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelNews : NSObject

@property(nonatomic,copy) NSString* contentId;
@property(nonatomic,copy) NSString* channelId;
@property(nonatomic,copy) NSString* cuserId;
@property(nonatomic,copy) NSString* contentTitle;
@property(nonatomic,copy) NSString* contentDate;
@property(nonatomic,copy) NSString* viewTimes;
@property(nonatomic,copy) NSString* contentOrigin;
@property(nonatomic,copy) NSString* contentTxt;

+(ChannelNews*) initWithDictionary:(NSDictionary *)dic;
@end
