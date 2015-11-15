//
//  UserInstance.h
//  kindergarten
//
//  Created by Scu_lbl on 15/5/2.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "User.h"

@interface UserInstance : NSObject
+(UserInstance *)sharedUserInstance;
-(void)setUserInstance:(User*)newUser;
-(User*)UserInstance;
@end
