//
//  NSObject+FlyDetailForm.m
//  PVAr
//
//  Created by Roberto Daviduk on 15/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "FlyDetailForm.h"
#import "Constants.h"

@implementation FlyDetailForm

- (id)init{
    if ((self = [super init])){
        //set up dictionary for storing form values
        //we could prepopulate this with defaults if we wanted
        //or load previously saved values from a file or database
        
        _valuesByKey = [NSMutableDictionary dictionary];
    }
    return self;
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if(self){
        self.valuesByKey = [[NSMutableDictionary alloc] initWithDictionary:dict];
    }
    return self;
}


//these two methods proxy any values that we set/get on the form
//to the internal valuesByKey dictionary. you don't have to store
//them in a dictionary though - you could put them into a coredata
//object, or save them in a database, or whatever

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if (value)
    {
        self.valuesByKey[key] = value;
    }
    else
    {
        [self.valuesByKey removeObjectForKey:key];
    }
}

- (id)valueForUndefinedKey:(NSString *)key{
    return self.valuesByKey[key];
}

//load the complete specificiation for all our fields from a json file
//we could equally use a plist, or an array that we downloaded from a web service
//or loaded from a database of some kind - as long as it contains the right
//structure, it doesn't matter where it comes from

- (NSArray *)fields{
    return @[
             
             //we want to add a group header for the field set of fields
             //we do that by adding the header key to the first field in the group
             
             @{FXFormFieldKey: @"number", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlynumber], FXFormFieldHeader: @"Fly Information"},
             @{FXFormFieldKey: @"priority", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlypriority]},
             @{FXFormFieldKey: @"enrollment", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlyenrollment]},
             @{FXFormFieldKey: @"company", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlycompany]},
             @{FXFormFieldKey: @"rule", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlyrule]},
             @{FXFormFieldKey: @"type", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlytype]},
             
             @{FXFormFieldKey: @"aeroplaneNumber", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlyaeroplaneNumber], FXFormFieldHeader: @"Aeroplane information"},
             @{FXFormFieldKey: @"aeroplaneType", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlyaeroplaneType]},
             @{FXFormFieldKey: @"category", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlycategory]},
             @{FXFormFieldKey: @"equipment", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlyequipment]},
             
             @{FXFormFieldKey: @"aerodrome", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlyaerodrome], FXFormFieldHeader: @""},
             @{FXFormFieldKey: @"date", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlydate]},
             @{FXFormFieldKey: @"time", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlytime]},
             @{FXFormFieldKey: @"unit", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlyunit]},
             @{FXFormFieldKey: @"speed", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlyspeed]},
             @{FXFormFieldKey: @"level", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlylevel]},
             
             @{FXFormFieldKey: @"origin", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlyorigin], FXFormFieldHeader: @""},
             @{FXFormFieldKey: @"destination", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlydestination]},
             @{FXFormFieldKey: @"EET", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlyEET]},
             @{FXFormFieldKey: @"alternative", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlyalternative], FXFormFieldSortable: @YES},
             @{FXFormFieldKey: @"information", FXFormFieldDefaultValue : [self.valuesByKey valueForKey:ModelFlyinformation], FXFormFieldType: FXFormFieldTypeLongText},
             
             ];
}

@end
