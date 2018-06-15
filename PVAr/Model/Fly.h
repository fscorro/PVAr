//
//  NSObject+Fly.h
//  PVAr
//
//  Created by Roberto Daviduk on 15/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fly : NSObject

@property (nonatomic, copy) NSString *number;
@property (nonatomic, assign) NSString *priority;
@property (nonatomic, copy) NSString *enrollment;
@property (nonatomic, copy) NSString *company;
@property (nonatomic, assign) NSString *rule;
@property (nonatomic, assign) NSString *type;

@property (nonatomic, copy) NSString *aeroplaneNumber;
@property (nonatomic, copy) NSString *aeroplaneType;
@property (nonatomic, assign) NSString *category;
@property (nonatomic, copy) NSString *equipment;

@property (nonatomic, copy) NSString *aerodrome;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSDate *time;
@property (nonatomic, assign) NSString *unit;
@property (nonatomic, copy) NSString *speed;
@property (nonatomic, assign) NSString *level;

@property (nonatomic, copy) NSString *origin;
@property (nonatomic, copy) NSString *destination;
@property (nonatomic, copy) NSString *EET;
@property (nonatomic, strong) NSArray *alternative;
@property (nonatomic, copy) NSString *information;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end
