//
//  Baby.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/2.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "Baby.h"

@implementation Baby

- (NSDictionary*) dictionaryFromObject{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setValue:self.bid forKey:@"babyId"];
    [dictionary setValue:self.name forKey:@"babyName"];
    [dictionary setValue:self.birthday forKey:@"birthday"];
    [dictionary setValue:self.parentId forKey:@"parentId"];
    [dictionary setValue:self.classId forKey:@"classId"];
    [dictionary setValue:self.babyNike forKey:@"babyNike"];
    [dictionary setValue:self.fatherTel forKey:@"fatherTel"];
    [dictionary setValue:self.fatherName forKey:@"fatherName"];
    [dictionary setValue:self.motherName forKey:@"motherName"];
    [dictionary setValue:self.motherTel forKey:@"motherTel"];
    [dictionary setValue:self.address forKey:@"address"];
    [dictionary setValue:self.postcode forKey:@"postcode"];
    [dictionary setValue:self.entranceDate forKey:@"entranceDate"];
    [dictionary setValue:self.babyRemark forKey:@"babyRemark"];
    return dictionary;
}

+(Baby*) initWithDictionary:(NSDictionary *)dic{
    Baby *baby = [[Baby alloc] init];
    baby.bid = [dic valueForKey:@"babyId"];
    baby.name = [dic valueForKey:@"babyName"];
    baby.birthday = [dic valueForKey:@"birthday"];
    baby.parentId = [dic valueForKey:@"parentId"];
    baby.classId = [dic valueForKey:@"classId"];
    baby.babyNike = [dic valueForKey:@"babyNike"];
    baby.fatherTel = [dic valueForKey:@"fatherTel"];
    baby.fatherName = [dic valueForKey:@"fatherName"];
    baby.motherName = [dic valueForKey:@"motherName"];
    baby.motherTel = [dic valueForKey:@"motherTel"];
    baby.address = [dic valueForKey:@"address"];
    baby.postcode = [dic valueForKey:@"postcode"];
    baby.entranceDate = [dic valueForKey:@"entranceDate"];
    baby.babyRemark = [dic valueForKey:@"babyRemark"];
    return baby;
}
- (void)dealloc{
    NSLog(@"Baby is dead");
}
@end
