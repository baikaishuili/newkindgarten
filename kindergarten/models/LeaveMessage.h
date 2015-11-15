//
//  LeaveMessage.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/31.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeaveMessage : NSObject
@property(nonatomic,copy) NSString* mid;
@property(nonatomic,copy) NSString* date;
@property(nonatomic,copy) NSString* userId;
@property(nonatomic,copy) NSString* phone;
@property(nonatomic,copy) NSString* content;

- (NSDictionary*) dictionaryFromObject;

@end
