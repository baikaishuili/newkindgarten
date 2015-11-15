//
//  NewsChannel.h
//  kindergarten
//
//  Created by Scu_lbl on 15/10/21.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ResponseResult;
@interface NewsChannelService : NSObject
- (ResponseResult*) getNewsChannel;
- (ResponseResult*) getContentList:(NSString*) channelId pageNo:(int) pageNo pageSize:(int) pageSize;
- (ResponseResult*) getContent:(NSString*) contentId;
@end
