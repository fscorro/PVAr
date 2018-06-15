//
//  NSObject+FlyDetailForm.h
//  PVAr
//
//  Created by Roberto Daviduk on 15/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FXForms/FXForms.h>

@interface FlyDetailForm : NSObject <FXForm>

@property (nonatomic, strong) NSMutableDictionary *valuesByKey;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end
