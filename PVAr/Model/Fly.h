//
//  NSObject+Fly.h
//  PVAr
//
//  Created by Roberto Daviduk on 15/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fly : NSObject

@property (nonatomic, copy) NSString *flyID;
@property (nonatomic, copy) NSString *flyNumber;
@property (nonatomic, copy) NSString *flyOrigin;
@property (nonatomic, copy) NSString *flyDestination;
@property (nonatomic, copy) NSArray *flyAlternatives;
@property (nonatomic, copy) NSString *flyDate;
@property (nonatomic, copy) NSString *flyTime;
@property (nonatomic, copy) NSString *flyEnrollment;
@property (nonatomic, copy) NSString *flyRule;
@property (nonatomic, copy) NSString *flyUtilizationCheck;
@property NSInteger flyAeroplaneNUmbers;
@property (nonatomic, copy) NSString *flyAeroplaneType;
@property (nonatomic, copy) NSString *flyCategory;
@property (nonatomic, copy) NSString *flyEquipment;
@property (nonatomic, copy) NSString *flyVelocity;
@property (nonatomic, copy) NSString *flyLevel;
@property (nonatomic, copy) NSString *flyTotalEET;
@property (nonatomic, copy) NSArray *flyRout;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end
