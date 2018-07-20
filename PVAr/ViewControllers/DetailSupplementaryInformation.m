//
//  UIViewController+DetailSupplementaryInformation.m
//  PVAr
//
//  Created by Roberto Daviduk on 20/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "DetailSupplementaryInformation.h"
#import "Constants.h"
#import "Utils.h"

typedef NS_ENUM(NSInteger, FlyCreationType) {
    FlyComplete = 0,
    FlySimplified
};

@implementation DetailSupplementaryInformation

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self initializeForm];
}

-(void)initializeForm{
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [XLFormDescriptor formDescriptor];
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyEndurance rowType:XLFormRowDescriptorTypeText title:@"Endurance"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:[[Utils sharedUtils] leftViewForTextfieldWithLabelText:@"E" isEnabled:false] forKey:@"textField.leftView"];
    [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.leftViewMode"];
    row.value = self.fly.endurance != nil ?  self.fly.endurance : @"None";
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyPersonsOnBoard rowType:XLFormRowDescriptorTypeText title:@"Persons on board"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:[[Utils sharedUtils] leftViewForTextfieldWithLabelText:@"P" isEnabled:false] forKey:@"textField.leftView"];
    [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.leftViewMode"];
    row.value = self.fly.personsOnBoard != nil ?  self.fly.personsOnBoard : @"None";
    row.disabled = @YES;
    [section addFormRow:row];
    
    if(self.fly.flyCreationType == FlyComplete){
        
        row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyHasEmergencyRadio rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Emergency radio"];
        [row.cellConfigAtConfigure setObject:AppColorLight forKey:@"switchControl.onTintColor"];
        row.value = @(self.fly.hasEmergencyRadio);
        row.disabled = @YES;
        [section addFormRow:row];
        
        row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyEmergencyRadio rowType:XLFormRowDescriptorTypeMultipleSelector title:@"Selected options"];
        row.selectorOptions = self.fly.emergencyRadio != nil ? self.fly.emergencyRadio : @[@"None"];
        row.value = self.fly.emergencyRadio != nil ?  self.fly.emergencyRadio : @[@"None"];
        row.disabled = @YES;
        row.hidden = [NSString stringWithFormat:@"$%@ == 0", ModelFlyHasEmergencyRadio];
        [section addFormRow:row];
        
        row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyHasSurvivalEquipment rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Survival equipment"];
        [row.cellConfigAtConfigure setObject:AppColorLight forKey:@"switchControl.onTintColor"];
        row.value = @(self.fly.hasSurvivalEquipment);
        row.disabled = @YES;
        [section addFormRow:row];
        
        row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlySurvivalEquipment rowType:XLFormRowDescriptorTypeMultipleSelector title:@"Selected options"];
        row.selectorOptions = self.fly.survivalEquipment != nil ?  self.fly.survivalEquipment : @[@"None"];
        row.value = self.fly.survivalEquipment != nil ?  self.fly.survivalEquipment : @[@"None"];
        row.disabled = @YES;
        row.hidden = [NSString stringWithFormat:@"$%@ == 0", ModelFlyHasSurvivalEquipment];
        [section addFormRow:row];
        
        row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyHasJackets rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Jackets"];
        [row.cellConfigAtConfigure setObject:AppColorLight forKey:@"switchControl.onTintColor"];
        row.value = @(self.fly.hasJackets);
        row.disabled = @YES;
        [section addFormRow:row];
        
        row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyJackets rowType:XLFormRowDescriptorTypeMultipleSelector title:@"Selected options"];
        row.selectorOptions = self.fly.jackets != nil ?  self.fly.jackets : @[@"None"];
        row.value = self.fly.jackets != nil ?  self.fly.jackets : @[@"None"];
        row.disabled = @YES;
        row.hidden = [NSString stringWithFormat:@"$%@ == 0", ModelFlyHasJackets];
        [section addFormRow:row];
        
        
        section = [XLFormSectionDescriptor formSectionWithTitle:@""];
        [form addFormSection:section];
        
        row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghies rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Dinghies"];
        row.value = @(self.fly.dinghies);
        [row.cellConfigAtConfigure setObject:AppColorLight forKey:@"switchControl.onTintColor"];
        row.disabled = @YES;
        [section addFormRow:row];
        
        
        section = [XLFormSectionDescriptor formSectionWithTitle:@""];
        section.hidden = @(!self.fly.dinghies);
        [form addFormSection:section];
        
        row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghiesNumber rowType:XLFormRowDescriptorTypeText title:@"Number"];
        [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
        row.value = self.fly.dinghiesNumber != nil ?  self.fly.dinghiesNumber : @"None";
        row.disabled = @YES;
        [section addFormRow:row];
        
        row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghiesCapacity rowType:XLFormRowDescriptorTypeText title:@"Capacity"];
        [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
        row.value = self.fly.dinghiesCapacity != nil ?  self.fly.dinghiesCapacity : @"None";
        row.disabled = @YES;
        [section addFormRow:row];
        
        row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghiesHasCover rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Cover"];
        row.value = @(self.fly.cover);
        [row.cellConfigAtConfigure setObject:AppColorLight forKey:@"switchControl.onTintColor"];
        row.disabled = @YES;
        [section addFormRow:row];
        
        row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghiesCoverColor rowType:XLFormRowDescriptorTypeText title:@"Colour"];
        [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
        row.hidden = @(!self.fly.cover);
        row.value = self.fly.coverColour != nil ?  self.fly.coverColour : @"None";
        row.disabled = @YES;
        [section addFormRow:row];
        
        
        section = [XLFormSectionDescriptor formSectionWithTitle:@""];
        [form addFormSection:section];
        
        row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyAircraftColor rowType:XLFormRowDescriptorTypeText title:@"Aircraft color and marking"];
        [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
        [row.cellConfig setObject:[[Utils sharedUtils] leftViewForTextfieldWithLabelText:@"A" isEnabled:false] forKey:@"textField.leftView"];
        [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.leftViewMode"];
        row.value = self.fly.aircraftColor != nil ?  self.fly.aircraftColor : @"None";
        row.disabled = @YES;
        [section addFormRow:row];
        
        row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyRemakrs rowType:XLFormRowDescriptorTypeText title:@"Remarks"];
        [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
        [row.cellConfig setObject:[[Utils sharedUtils] leftViewForTextfieldWithLabelText:@"N" isEnabled:false] forKey:@"textField.leftView"];
        [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.leftViewMode"];
        row.value = self.fly.remarks != nil ?  self.fly.remarks : @"None";
        row.disabled = @YES;
        [section addFormRow:row];
        
    }
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyPilotInCommand rowType:XLFormRowDescriptorTypeText title:@"Pilot in-command"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:[[Utils sharedUtils] leftViewForTextfieldWithLabelText:@"C" isEnabled:false] forKey:@"textField.leftView"];
    [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.leftViewMode"];
    row.value = self.fly.pilotInCommand != nil ?  self.fly.pilotInCommand : @"None";
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyPilotLicence rowType:XLFormRowDescriptorTypeText title:@"Licence"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.pilotLicence != nil ?  self.fly.pilotLicence : @"None";
    row.disabled = @YES;
    [section addFormRow:row];
    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Aditional requirements."];
    [form addFormSection:section];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyAditionalRequirements rowType:XLFormRowDescriptorTypeTextView title:@"Notes"];
    row.value = self.fly.aditionalRequirements;
    row.disabled = @YES;
    [section addFormRow:row];
    
    
    self.form = form;
    
}

@end
