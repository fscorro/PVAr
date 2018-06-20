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
        self.enrollment = [dict valueForKey:ModelFlyenrollment];
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

        self.origin = [dict valueForKey:ModelFlyorigin];
        self.destination = [dict valueForKey:ModelFlydestination];
        self.EET = [dict valueForKey:ModelFlyEET];
        self.alternative = [dict valueForKey:ModelFlyalternative];
        self.information = [dict valueForKey:ModelFlyinformation];
        
        self.endurance = [dict valueForKey:ModelFlyEndurance];
        self.personsOnBoard = [dict valueForKey:ModelFlyPersonsOnBoard];
        self.options1 = [dict valueForKey:ModelFlyOptions1];
        self.options2 = [dict valueForKey:ModelFlyOptions2];
        self.numberSupplementary = [dict valueForKey:ModelFlyNumberSupplementary];
        self.capacity = [dict valueForKey:ModelFlyCapacity];
        self.hasCover = [dict valueForKey:ModelFlyHasCover];
        self.coverColor = [dict valueForKey:ModelFlyCoverColor];
        self.aircraftColor = [dict valueForKey:ModelFlyAircraftColor];
        self.observations = [dict valueForKey:ModelFlyObservations];
        self.licence = [dict valueForKey:ModelFlyLicence];
        self.licenceNumber = [dict valueForKey:ModelFlyLicenceNumber];
    }
    return self;
}

@end
