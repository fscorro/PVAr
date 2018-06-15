//
//  NSObject+FlyForm.m
//  PVAr
//
//  Created by Roberto Daviduk on 15/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "FlyForm.h"
#import "Constants.h"

@implementation FlyForm

- (NSArray *)fields{
    return @[
             
             //we want to add a group header for the field set of fields
             //we do that by adding the header key to the first field in the group
             
             @{FXFormFieldKey: @"number", FXFormFieldHeader: @"Fly Information"},
             @{FXFormFieldKey: @"priority", FXFormFieldOptions: @[@"ALTRV", @"ATFMX", @"FFR", @"FLTCK", @"HAZMAT", @"HEAD", @"HOSP", @"HUM", @"MARSA", @"MEDEVAC", @"NONRVSM", @"SAR", @"STATUS"]},
             @"enrollment",
             @"company",
             @{FXFormFieldKey: @"rule", FXFormFieldOptions: @[@"I - Vuelo con IFR", @"V - Vuelo con VFR", @"Y - IFR con cambio de regla de vuelo", @"Z - VFR con cambio de regla de vuelo"]},
             @{FXFormFieldKey: @"type", FXFormFieldOptions: @[@"S - Regular", @"N - No regular", @"G - General", @"M - Militar", @"X - Otra"]},
             
             @{FXFormFieldKey: @"aeroplaneNumber", FXFormFieldHeader: @"Aeroplane information"},
             @"aeroplaneType",
             @{FXFormFieldKey: @"category", FXFormFieldOptions: @[@"H - Pesada", @"M - Media", @"L - Liviana"]},
             @"equipment",
             
             @{FXFormFieldKey: @"aerodrome", FXFormFieldHeader: @""},
             @"date",
             @"time",
             @{FXFormFieldKey: @"unit", FXFormFieldOptions: @[@"K - Kilometros", @"N - Nodos", @"M - Número de Mach"]},
             @"speed",
             @{FXFormFieldKey: @"level", FXFormFieldOptions: @[@"F - Nivel de vuelo", @"S - Nivel metrico", @"A - Altitud centenares de pies", @"M - Altitud decenas de metros"]},
             
             @{FXFormFieldKey: @"origin", FXFormFieldHeader: @""},
             @"destination",
             @"EET",
             @{FXFormFieldKey: @"alternative", FXFormFieldSortable: @YES},
             @{FXFormFieldKey: @"information", FXFormFieldType: FXFormFieldTypeLongText},

             @{FXFormFieldTitle: @"Submit", FXFormFieldHeader: @"", FXFormFieldAction: @"submitFlyingForm:"},
             
             ];
}

-(BOOL)validateFlyForm{

    return true;
}
@end
