//
//  HealthWatch.m
//  kindergarten
//
//  Created by Scu_lbl on 15/6/3.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "HealthWatch.h"

@implementation HealthWatch
+(HealthWatch*) initWithDictionary:(NSDictionary *)dic{
    HealthWatch *healthWatch = [[HealthWatch alloc] init];
    healthWatch.hid = [dic objectForKey:@"id"];
    healthWatch.babyId = [dic objectForKey:@"babyId"];
    healthWatch.date = [dic objectForKey:@"watchDate"];
    healthWatch.spirit = [dic objectForKey:@"spirit"];
    healthWatch.appetite = [dic objectForKey:@"appetite"];
    healthWatch.sleep = [dic objectForKey:@"sleep"];
    healthWatch.cough = [dic objectForKey:@"cough"];
    healthWatch.takeMedicine = [dic objectForKey:@"takeMedicine"];
    healthWatch.medicineAm = [[dic objectForKey:@"medicineAm"] intValue];
    healthWatch.medicineNoon = [[dic objectForKey:@"medicineNoon"] intValue];
    healthWatch.medicinePm = [[dic objectForKey:@"medicinePm"] intValue];
    healthWatch.doDefecate = [dic objectForKey:@"doDefecate"];
    healthWatch.defecateAm = [[dic objectForKey:@"defecateAm"] intValue];
    healthWatch.defecateNoon = [[dic objectForKey:@"defecateNoon"] intValue];
    healthWatch.defecatePm = [[dic objectForKey:@"defecatePm"] intValue];
    healthWatch.remark = [dic objectForKey:@"remark"];
    return healthWatch;
}
@end
