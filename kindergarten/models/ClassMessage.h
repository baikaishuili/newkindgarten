//
//  ClassMessage.h
//  kindergarten
//
//  Created by Scu_lbl on 15/6/7.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassMessage : NSObject
@property(nonatomic,copy) NSString* mid;
@property(nonatomic,copy) NSString* babyName;
@property(nonatomic,copy) NSString* date;
@property(nonatomic,copy) NSString* babyId;
@property(nonatomic,copy) NSString* classId;
@property(nonatomic,copy) NSString* content;
@property(nonatomic,copy) NSString* replay;
@property(nonatomic,copy) NSString* isUpload;

- (NSDictionary*) dictionaryFromObject;
@end
