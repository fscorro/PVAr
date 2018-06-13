//
//  NSObject+User.m
//  PVAr
//
//  Created by Prisma on 12/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "User.h"
#import "Constants.h"

@implementation User

-(instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if(self){
        self.email = [dict valueForKey:ModelUserEmailKEY];
        self.password = [dict valueForKey:ModelUserPasswordKEY];
        self.repeatPassword = [dict valueForKey:ModelUserRepeatPasswordKEY];
    }
    return self;
}

@end
