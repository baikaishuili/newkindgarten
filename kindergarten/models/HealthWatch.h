//
//  HealthWatch.h
//  kindergarten
//
//  Created by Scu_lbl on 15/6/3.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HealthWatch : NSObject
@property(nonatomic,copy) NSString* hid;
@property(nonatomic,copy) NSString* date;
@property(nonatomic,copy) NSString* babyId;
@property(nonatomic,copy) NSString* spirit;
@property(nonatomic,copy) NSString* appetite;
@property(nonatomic,copy) NSString* cough;
@property(nonatomic,assign) bool takeMedicine;
@property(nonatomic,assign) int medicineAm;
@property(nonatomic,assign) int medicineNoon;
@property(nonatomic,assign) int medicinePm;
@property(nonatomic,copy) NSString* sleep;
@property(nonatomic,assign) bool doDefecate;
@property(nonatomic,assign) int defecateAm;
@property(nonatomic,assign) int defecateNoon;
@property(nonatomic,assign) int defecatePm;
@property(nonatomic,copy) NSString* remark;

+(HealthWatch*) initWithDictionary:(NSDictionary *)dic;
@end
