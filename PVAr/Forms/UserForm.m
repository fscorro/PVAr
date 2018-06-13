//
//  NSObject+UserForm.m
//  PVAr
//
//  Created by Prisma on 12/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "UserForm.h"

@implementation UserForm

- (NSArray *)fields
{
    return @[
             
             //we want to add a group header for the field set of fields
             //we do that by adding the header key to the first field in the group
             
             @{FXFormFieldKey: @"email", FXFormFieldHeader: @"Account"},
             
             //we don't need to modify these fields at all, so we'll
             //just refer to them by name to use the default settings
             
             @"password",
             @"repeatPassword",
             
             @{FXFormFieldTitle: @"Create", FXFormFieldHeader: @"", FXFormFieldAction: @"submitRegistrationForm:"},
             
             ];
}
@end
