//
//  ResponseResult.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/2.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseResult : NSObject
@property(nonatomic, copy) NSString* resultCode; //返回结果代码 预留字段 目前服务器没有这个字段
@property(nonatomic, copy) NSString* info; //本来不应该要这个字段的，主要是为了迎合服务器
@property(nonatomic, copy) NSString* message; //返回的结果解释
@property(nonatomic, strong) id data;
@end
