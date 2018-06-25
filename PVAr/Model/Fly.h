//
//  NSObject+Fly.h
//  PVAr
//
//  Created by Roberto Daviduk on 15/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fly : NSObject

@property (nonatomic, copy) NSString *flyState;

@property (nonatomic, copy) NSString *number;
@property (nonatomic, copy) NSString *priority;
@property (nonatomic, copy) NSString *enrollment;
@property (nonatomic, copy) NSString *company;
@property (nonatomic, copy) NSString *rule;
@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *aeroplaneNumber;
@property (nonatomic, copy) NSString *aeroplaneType;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *equipment;

@property (nonatomic, copy) NSString *originAerodrome;
@property (nonatomic, copy) NSString *destinationAerodrome;
@property (nonatomic, strong) NSDate *dateTime;
@property (nonatomic, copy) NSString *unit;
@property (nonatomic, copy) NSString *speed;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *route;

@property (nonatomic, copy) NSString *EET;
@property (nonatomic, strong) NSArray *alternative;
@property (nonatomic, copy) NSString *information;

@property (nonatomic, strong) NSDictionary *supplementary;

@property (nonatomic, copy) NSString *endurance;
@property (nonatomic, copy) NSString *personsOnBoard;
@property BOOL hasEmergencyRadio;
@property (nonatomic, strong) NSArray *emergencyRadio;
@property BOOL hasSurvivalEquipment;
@property (nonatomic, strong) NSArray *survivalEquipment;
@property BOOL hasJackets;
@property (nonatomic, strong) NSArray *jackets;
@property BOOL dinghies;
@property (nonatomic, copy) NSString *dinghiesNumber;
@property (nonatomic, copy) NSString *dinghiesCapacity;
@property BOOL cover;
@property (nonatomic, copy) NSString *coverColour;
@property (nonatomic, copy) NSString *aircraftColor;
@property (nonatomic, copy) NSString *remarks;
@property (nonatomic, copy) NSString *pilotInCommand;
@property (nonatomic, copy) NSString *pilotLicence;
@property (nonatomic, copy) NSString *aditionalRequirements;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end
