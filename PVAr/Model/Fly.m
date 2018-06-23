//
//  NSObject+Fly.m
//  PVAr
//
//  Created by Roberto Daviduk on 15/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "Fly.h"
#import "Constants.h"

@implementation Fly

-(instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if(self){
        self.flyState = [dict valueForKey:ModelFlystate];

        self.number = [dict valueForKey:ModelFlynumber];
        self.priority = [dict valueForKey:ModelFlypriority];
        self.enrollment = [dict valueForKey:ModelFlyRegister];
        self.company = [dict valueForKey:ModelFlycompany];
        self.rule = [dict valueForKey:ModelFlyrule];
        self.type = [dict valueForKey:ModelFlytype];

        self.aeroplaneNumber = [dict valueForKey:ModelFlyaeroplaneNumber];
        self.aeroplaneType = [dict valueForKey:ModelFlyaeroplaneType];
        self.category = [dict valueForKey:ModelFlycategory];
        self.equipment = [dict valueForKey:ModelFlyequipment];

        self.aerodrome = [dict valueForKey:ModelFlyaerodrome];
        self.date = [dict valueForKey:ModelFlydate];
        self.time = [dict valueForKey:ModelFlytime];
        self.unit = [dict valueForKey:ModelFlyunit];
        self.speed = [dict valueForKey:ModelFlyspeed];
        self.level = [dict valueForKey:ModelFlylevel];
        self.route = [dict valueForKey:ModelFlyroute];

        self.origin = [dict valueForKey:ModelFlyorigin];
        self.destination = [dict valueForKey:ModelFlydestination];
        self.EET = [dict valueForKey:ModelFlyEET];
        self.alternative = [dict valueForKey:ModelFlyalternative];
        self.information = [dict valueForKey:ModelFlyinformation];

        
        self.supplementary = [dict valueForKey:ModelFlySupplementaryDictionary];
        
        self.endurance = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyEndurance];
        self.personsOnBoard = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyPersonsOnBoard];
        self.emergencyRadio = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyEmergencyRadio];
        self.survivalEquipment = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlySurvivalEquipment];
        self.jackets = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyJackets];
        self.dinghies = [[[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyDinghies] boolValue];
        self.dinghiesNumber = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyDinghiesNumber];
        self.dinghiesCapacity = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyDinghiesCapacity];
        self.cover = [[[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyDinghiesHasCover] boolValue];
        self.coverColour = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyDinghiesCoverColor];
        self.aircraftColor = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyAircraftColor];
        self.remarks = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyRemakrs];
        self.pilotInCommand = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyPilotInCommand];
        self.aditionalRequirements = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyAditionalRequirements];

    }
    return self;
}

@end
