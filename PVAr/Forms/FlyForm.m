//
//  NSObject+FlyForm.m
//  PVAr
//
//  Created by Roberto Daviduk on 15/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "FlyForm.h"

@implementation FlyForm

- (NSArray *)fields
{
    return @[
             
             //we want to add a group header for the field set of fields
             //we do that by adding the header key to the first field in the group
             
             @{FXFormFieldKey: @"number", FXFormFieldHeader: @"Fly Information"},
             @{FXFormFieldKey: @"priority", FXFormFieldOptions: @[@"ALTRV", @"ATFMX", @"FFR", @"FLTCK", @"HAZMAT", @"HEAD", @"HOSP", @"HUM", @"MARSA", @"MEDEVAC", @"NONRVSM", @"SAR", @"STATUS"]},
             @"enrollment",
             @"company",
             @{FXFormFieldKey: @"rule", FXFormFieldOptions: @[@"I", @"V", @"Y", @"Z"]},
             @{FXFormFieldKey: @"type", FXFormFieldOptions: @[@"S", @"N", @"G", @"M", @"X"]},
             
             @{FXFormFieldKey: @"aeroplaneNumber", FXFormFieldHeader: @"Aeroplane information"},
             @"aeroplaneType",
             @{FXFormFieldKey: @"category", FXFormFieldOptions: @[@"H", @"M", @"L"]},
             @"equipment",
             
             @{FXFormFieldKey: @"aerodrome", FXFormFieldHeader: @""},
             @"date",
             @"time",

             @{FXFormFieldTitle: @"Submit", FXFormFieldHeader: @"", FXFormFieldAction: @"submitFlyingForm:"},
             
             ];
}

-(BOOL)validateFlyForm{

    return true;
}
@end
