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
        self.flyCreationType = [[dict valueForKey:ModelFlyCreationType] integerValue];

        self.aeroplaneID = [dict valueForKey:ModelFlyaeroplaneID];
        self.rule = [dict valueForKey:ModelFlyrule];
        self.type = [dict valueForKey:ModelFlytype];

        self.aeroplaneNumber = [dict valueForKey:ModelFlyaeroplaneNumber];
        self.aeroplaneType = [dict valueForKey:ModelFlyaeroplaneType];
        self.category = [dict valueForKey:ModelFlycategory];
        
        self.equipment = [dict valueForKey:ModelFlyequipment];
        self.hasRadiocomunication = [[dict valueForKey:ModelFlyHasRadiocomunication] boolValue];
        self.radiocomunication = [dict valueForKey:ModelFlyRadiocomunication];
        self.hasVigilance = [[dict valueForKey:ModelFlyhasVigilance] boolValue];
        self.vigilance = [dict valueForKey:ModelFlyVigilance];

        self.originAerodrome = [dict valueForKey:ModelFlyoriginAerodrome];
        self.destinationAerodrome = [dict valueForKey:ModelFlydestinationAerodrome];
        self.dateTime = [dict valueForKey:ModelFlydateTime];
        self.unit = [dict valueForKey:ModelFlyunit];
        self.speedUnit = [dict valueForKey:ModelFlyspeedUnit];
        self.speed = [dict valueForKey:ModelFlyspeed];
        self.levelUnit = [dict valueForKey:ModelFlylevelUnit];
        self.level = [dict valueForKey:ModelFlylevel];
        self.route = [dict valueForKey:ModelFlyroute];

        self.EET = [dict valueForKey:ModelFlyEET];
        self.alternative = [dict valueForKey:ModelFlyalternative];
        self.information = [dict valueForKey:ModelFlyinformation];

        
        self.supplementary = [dict valueForKey:ModelFlySupplementaryDictionary];
        
        self.endurance = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyEndurance];
        self.personsOnBoard = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyPersonsOnBoard];
        self.hasEmergencyRadio = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyHasEmergencyRadio];
        self.emergencyRadio = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyEmergencyRadio];
        self.hasSurvivalEquipment = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyHasSurvivalEquipment];
        self.survivalEquipment = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlySurvivalEquipment];
        self.hasJackets = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyHasJackets];
        self.jackets = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyJackets];
        self.dinghies = [[[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyDinghies] boolValue];
        self.dinghiesNumber = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyDinghiesNumber];
        self.dinghiesCapacity = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyDinghiesCapacity];
        self.cover = [[[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyDinghiesHasCover] boolValue];
        self.coverColour = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyDinghiesCoverColor];
        self.aircraftColor = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyAircraftColor];
        self.hasRemarks = [[[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyHasRemakrs] boolValue];
        self.remarks = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyRemakrs];
        self.pilotInCommand = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyPilotInCommand];
        self.pilotLicence = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyPilotLicence];
        self.aditionalRequirements = [[dict valueForKey:ModelFlySupplementaryDictionary] valueForKey:ModelFlyAditionalRequirements];

    }
    return self;
}

@end
