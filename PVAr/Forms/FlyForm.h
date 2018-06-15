//
//  NSObject+FlyForm.h
//  PVAr
//
//  Created by Roberto Daviduk on 15/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FXForms/FXForms.h>

typedef NS_ENUM(NSInteger, Priority)
{
    PriorityALTRV = 0,
    PriorityATFMX, PriorityFFR, PriorityFLTCK, PriorityHAZMAT, PriorityHEAD, PriorityHOSP, PriorityHUM, PriorityMARSA, PriorityMEDEVAC, PriorityNONRVSM, PrioritySAR, PrioritySTATUS
};

typedef NS_ENUM(NSInteger, Rule)
{
    RuleI = 0,
    RuleV,
    RuleY,
    RuleZ
};

typedef NS_ENUM(NSInteger, Type)
{
    TypeS = 0,
    TypeN,
    TypeG,
    TypeM,
    TypeX
};

typedef NS_ENUM(NSInteger, AeroplaneCategory)
{
    AeroplaneCategoryH = 0,
    AeroplaneCategoryM,
    AeroplaneCategoryL
};

@interface FlyForm : NSObject <FXForm>

@property (nonatomic, copy) NSString *number;
@property (nonatomic, assign) Priority priority;
@property (nonatomic, copy) NSString *enrollment;
@property (nonatomic, copy) NSString *company;
@property (nonatomic, assign) Rule rule;
@property (nonatomic, assign) Type type;

@property (nonatomic, copy) NSString *aeroplaneNumber;
@property (nonatomic, copy) NSString *aeroplaneType;
@property (nonatomic, assign) AeroplaneCategory category;
@property (nonatomic, copy) NSString *equipment;

@property (nonatomic, copy) NSString *aerodrome;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSDate *time;


-(BOOL)validateFlyForm;

@end
