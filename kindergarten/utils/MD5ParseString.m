//
//  MD5ParseString.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/1.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "MD5ParseString.h"
#import <CommonCrypto/CommonDigest.h>
@implementation MD5ParseString

//32位MD5加密算法
+(NSString*)MD5:(NSString*) str{
    const char *original_str = [str UTF8String];
    unsigned char result[16];
    CC_MD5(original_str, (int)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}
@end
