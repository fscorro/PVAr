//
//  UIViewController+CreateSupplementaryInformation.m
//  PVAr
//
//  Created by Roberto Daviduk on 20/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "CreateSupplementaryInformation.h"
#import "Constants.h"
#import "Utils.h"

@interface CreateSupplementaryInformation(){

}
@end

@implementation CreateSupplementaryInformation

-(void)viewDidLoad{
    [super viewDidLoad];
    if(self.dicSupplementary == nil){
        self.dicSupplementary = [[NSMutableDictionary alloc] init];
    }
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
    [row.cellConfig setObject:[[Utils sharedUtils] leftViewForTextfieldWithLabelText:@"E" isEnabled:true] forKey:@"textField.leftView"];
    [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.leftViewMode"];
    
    row.required = NO;
    row.value = [self.dicSupplementary valueForKey:ModelFlyEndurance] != nil ? [self.dicSupplementary valueForKey:ModelFlyEndurance] : nil;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"Fly %@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{0,4}$"]];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyPersonsOnBoard rowType:XLFormRowDescriptorTypeText title:@"Persons on board"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:[[Utils sharedUtils] leftViewForTextfieldWithLabelText:@"P" isEnabled:true] forKey:@"textField.leftView"];
    [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.leftViewMode"];
    row.required = NO;
    row.value = [self.dicSupplementary valueForKey:ModelFlyPersonsOnBoard] != nil ? [self.dicSupplementary valueForKey:ModelFlyPersonsOnBoard] : nil;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyHasEmergencyRadio rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Emergency radio"];
    [row.cellConfigAtConfigure setObject:AppColorLight forKey:@"switchControl.onTintColor"];
    row.value = @([[self.dicSupplementary valueForKey:ModelFlyHasEmergencyRadio] boolValue]);
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyEmergencyRadio rowType:XLFormRowDescriptorTypeMultipleSelector title:@"Select options"];
    row.selectorOptions = @[@"U",@"V",@"E"];
    row.value = [self.dicSupplementary valueForKey:ModelFlyEmergencyRadio] != nil ? [self.dicSupplementary valueForKey:ModelFlyEmergencyRadio] : nil;
    row.hidden = [NSString stringWithFormat:@"$%@ == 0", ModelFlyHasEmergencyRadio];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyHasSurvivalEquipment rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Survival equipment"];
    [row.cellConfigAtConfigure setObject:AppColorLight forKey:@"switchControl.onTintColor"];
    row.value = @([[self.dicSupplementary valueForKey:ModelFlyHasSurvivalEquipment] boolValue]);
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlySurvivalEquipment rowType:XLFormRowDescriptorTypeMultipleSelector title:@"Select options"];
    row.selectorOptions = @[@"S",@"P",@"M",@"J"];
    row.value = [self.dicSupplementary valueForKey:ModelFlySurvivalEquipment] != nil ? [self.dicSupplementary valueForKey:ModelFlySurvivalEquipment] : nil;
    row.hidden = [NSString stringWithFormat:@"$%@ == 0", ModelFlyHasSurvivalEquipment];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyHasJackets rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Jackets"];
    [row.cellConfigAtConfigure setObject:AppColorLight forKey:@"switchControl.onTintColor"];
    row.value = @([[self.dicSupplementary valueForKey:ModelFlyHasJackets] boolValue]);
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyJackets rowType:XLFormRowDescriptorTypeMultipleSelector title:@"Select options"];
    row.selectorOptions = @[@"L",@"F",@"U",@"V"];
    row.value = [self.dicSupplementary valueForKey:ModelFlyJackets] != nil ? [self.dicSupplementary valueForKey:ModelFlyJackets] : nil;
    row.hidden = [NSString stringWithFormat:@"$%@ == 0", ModelFlyHasJackets];
    [section addFormRow:row];
    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghies rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Dinghies"];
    [row.cellConfigAtConfigure setObject:AppColorLight forKey:@"switchControl.onTintColor"];
    row.value = @([[self.dicSupplementary valueForKey:ModelFlyDinghies] boolValue]);
    [section addFormRow:row];

    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Dinghies"];
    section.hidden = [NSString stringWithFormat:@"$%@ == 0", ModelFlyDinghies];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghiesNumber rowType:XLFormRowDescriptorTypeText title:@"Number"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = NO;
    row.value = [self.dicSupplementary valueForKey:ModelFlyDinghiesNumber] != nil ? [self.dicSupplementary valueForKey:ModelFlyDinghiesNumber] : nil;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"Fly %@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{0,2}$"]];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghiesCapacity rowType:XLFormRowDescriptorTypeText title:@"Capacity"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = NO;
    row.value = [self.dicSupplementary valueForKey:ModelFlyDinghiesCapacity] != nil ? [self.dicSupplementary valueForKey:ModelFlyDinghiesCapacity] : nil;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"Fly %@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{0,4}$"]];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghiesHasCover rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Cover"];
    row.value = @([[self.dicSupplementary valueForKey:ModelFlyDinghiesHasCover] boolValue]);
    [row.cellConfigAtConfigure setObject:AppColorLight forKey:@"switchControl.onTintColor"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghiesCoverColor rowType:XLFormRowDescriptorTypeText title:@"Colour"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = NO;
    row.value = [self.dicSupplementary valueForKey:ModelFlyDinghiesCoverColor] != nil ? [self.dicSupplementary valueForKey:ModelFlyDinghiesCoverColor] : nil;
    row.hidden = [NSString stringWithFormat:@"$%@ == 0", ModelFlyDinghiesHasCover];
    [section addFormRow:row];
    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyAircraftColor rowType:XLFormRowDescriptorTypeText title:@"Aircraft color and marking"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:[[Utils sharedUtils] leftViewForTextfieldWithLabelText:@"A" isEnabled:true] forKey:@"textField.leftView"];
    [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.leftViewMode"];
    row.required = NO;
    row.value = [self.dicSupplementary valueForKey:ModelFlyAircraftColor] != nil ? [self.dicSupplementary valueForKey:ModelFlyAircraftColor] : nil;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyRemakrs rowType:XLFormRowDescriptorTypeText title:@"Remarks"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:[[Utils sharedUtils] leftViewForTextfieldWithLabelText:@"N" isEnabled:true] forKey:@"textField.leftView"];
    [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.leftViewMode"];
    row.required = NO;
    row.value = [self.dicSupplementary valueForKey:ModelFlyRemakrs] != nil ? [self.dicSupplementary valueForKey:ModelFlyRemakrs] : nil;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyPilotInCommand rowType:XLFormRowDescriptorTypeText title:@"Pilot in-command"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:[[Utils sharedUtils] leftViewForTextfieldWithLabelText:@"C" isEnabled:true] forKey:@"textField.leftView"];
    [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.leftViewMode"];
    row.required = NO;
    row.value = [self.dicSupplementary valueForKey:ModelFlyPilotInCommand] != nil ? [self.dicSupplementary valueForKey:ModelFlyPilotInCommand] : nil;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyPilotLicence rowType:XLFormRowDescriptorTypeText title:@"Licence"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = NO;
    row.value = [self.dicSupplementary valueForKey:ModelFlyPilotLicence] != nil ? [self.dicSupplementary valueForKey:ModelFlyPilotLicence] : nil;
    [section addFormRow:row];
    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Aditional requirements."];
    [form addFormSection:section];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyAditionalRequirements rowType:XLFormRowDescriptorTypeTextView title:@"Notes"];
    row.required = NO;
    row.value = [self.dicSupplementary valueForKey:ModelFlyAditionalRequirements] != nil ? [self.dicSupplementary valueForKey:ModelFlyAditionalRequirements] : nil;
    [section addFormRow:row];
    
    
    self.form = form;

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if ([self.delegate respondsToSelector:@selector(delegateVC:dicSupplementary:)]) {
        
        for(int i = 0; i < [[self.form formSections] count] ; i++){
            for (XLFormRowDescriptor *row in [[[self.form formSections] objectAtIndex:i] formRows]) {
                
                if([row.tag isEqualToString:ModelFlyHasEmergencyRadio] || [row.tag isEqualToString:ModelFlyHasSurvivalEquipment] || [row.tag isEqualToString:ModelFlyHasJackets]){
                    [self.dicSupplementary setValue:@([row.value boolValue]) forKey:row.tag];
                }else if([row.tag isEqualToString:ModelFlyEmergencyRadio] || [row.tag isEqualToString:ModelFlySurvivalEquipment] || [row.tag isEqualToString:ModelFlyJackets]){
                    [self.dicSupplementary setValue:row.value forKey:row.tag];
                }else if([row.tag isEqualToString:ModelFlyDinghies] || [row.tag isEqualToString:ModelFlyDinghiesHasCover]){
                    [self.dicSupplementary setValue:@([row.value boolValue]) forKey:row.tag];
                }else{
                    [self.dicSupplementary setValue:[row.value displayText] forKey:row.tag];
                }
            }
        }
        
        for (NSString *key in [self.dicSupplementary allKeys]) {
            if([key isEqualToString:ModelFlyHasEmergencyRadio] || [key isEqualToString:ModelFlyHasSurvivalEquipment] || [key isEqualToString:ModelFlyHasJackets]){
                BOOL switchKey = [[self.dicSupplementary objectForKey:key] boolValue];
                if(switchKey == false){
                    [self.dicSupplementary removeObjectForKey:key];
                }
            }else if ([key isEqualToString:ModelFlyDinghies]){
                if([[self.dicSupplementary objectForKey:ModelFlyDinghies] boolValue] == false){
                    for (NSString *key in [self.dicSupplementary allKeys]) {
                        if([key containsString:[ModelFlyDinghies lowercaseString]]){
                            [self.dicSupplementary removeObjectForKey:key];
                        }
                    }
                }
            }
        }
        
        [self.delegate delegateVC:self dicSupplementary:self.dicSupplementary];
    }
}
@end
