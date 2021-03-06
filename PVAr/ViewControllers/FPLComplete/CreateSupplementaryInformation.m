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

typedef NS_ENUM(NSInteger, TextfieldTagSupp) {
    TextfieldTagSuppEndurance = 1,
    TextfieldTagSuppPersonOnBoard,
    TextfieldTagSuppEmergencyRadio,
    TextfieldTagSuppSurvivalEquipment,
    TextfieldTagSuppJackets,
    TextfieldTagSuppDinghiesNumber,
    TextfieldTagSuppDinghiesCapacity
};

@interface CreateSupplementaryInformation(){
    XLFormRowDescriptor * rowEndurancePicker;
    XLFormRowDescriptor *segueSelectedRow;
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

    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyEndurance rowType:XLFormRowDescriptorTypeZipCode title:@"Endurance (E)"];
    [row.cellConfigAtConfigure setObject:@(NO) forKey:@"textField.userInteractionEnabled"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:@(TextfieldTagSuppEndurance) forKey:@"textField.tag"];
    row.required = NO;
    row.value = [self.dicSupplementary valueForKey:ModelFlyEndurance] != nil ? [self.dicSupplementary valueForKey:ModelFlyEndurance] : nil;
    [section addFormRow:row];
    
    rowEndurancePicker = [XLFormRowDescriptor formRowDescriptorWithTag:@"rowEndurancePicker" rowType:XLFormRowDescriptorTypeDatePicker];
    [rowEndurancePicker.cellConfigAtConfigure setObject:@(UIDatePickerModeCountDownTimer) forKey:@"datePicker.datePickerMode"];
    rowEndurancePicker.hidden = @(YES);
    [section addFormRow:rowEndurancePicker];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyPersonsOnBoard rowType:XLFormRowDescriptorTypeInteger title:@"Persons on board (P)"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:@(TextfieldTagSuppPersonOnBoard) forKey:@"textField.tag"];
    row.required = NO;
    row.value = [self.dicSupplementary valueForKey:ModelFlyPersonsOnBoard] != nil ? [self.dicSupplementary valueForKey:ModelFlyPersonsOnBoard] : nil;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyHasEmergencyRadio rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Emergency radio (E)"];
    [row.cellConfigAtConfigure setObject:AppColorLight forKey:@"switchControl.onTintColor"];
    row.value = @([[self.dicSupplementary valueForKey:ModelFlyHasEmergencyRadio] boolValue]);
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyEmergencyRadio rowType:XLFormRowDescriptorTypeZipCode title:@"Select options"];
    row.value = [[self.dicSupplementary valueForKey:ModelFlyEmergencyRadio] componentsJoinedByString:@","];
    [row.cellConfig setObject:[[Utils sharedUtils] addTextfieldImageBox] forKey:@"textField.rightView"];
    [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.rightViewMode"];
    [row.cellConfigAtConfigure setObject:@(NO) forKey:@"textField.userInteractionEnabled"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:@(TextfieldTagSuppEmergencyRadio) forKey:@"textField.tag"];
    row.hidden = [NSString stringWithFormat:@"$%@ == 0", ModelFlyHasEmergencyRadio];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyHasSurvivalEquipment rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Survival equipment (S)"];
    [row.cellConfigAtConfigure setObject:AppColorLight forKey:@"switchControl.onTintColor"];
    row.value = @([[self.dicSupplementary valueForKey:ModelFlyHasSurvivalEquipment] boolValue]);
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlySurvivalEquipment rowType:XLFormRowDescriptorTypeZipCode title:@"Select options"];
    row.value = [[self.dicSupplementary valueForKey:ModelFlySurvivalEquipment] componentsJoinedByString:@","];
    [row.cellConfig setObject:[[Utils sharedUtils] addTextfieldImageBox] forKey:@"textField.rightView"];
    [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.rightViewMode"];
    [row.cellConfigAtConfigure setObject:@(NO) forKey:@"textField.userInteractionEnabled"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:@(TextfieldTagSuppSurvivalEquipment) forKey:@"textField.tag"];
    row.hidden = [NSString stringWithFormat:@"$%@ == 0", ModelFlyHasSurvivalEquipment];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyHasJackets rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Jackets (J)"];
    [row.cellConfigAtConfigure setObject:AppColorLight forKey:@"switchControl.onTintColor"];
    row.value = @([[self.dicSupplementary valueForKey:ModelFlyHasJackets] boolValue]);
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyJackets rowType:XLFormRowDescriptorTypeZipCode title:@"Select options"];
    row.value = [[self.dicSupplementary valueForKey:ModelFlyJackets] componentsJoinedByString:@","];
    [row.cellConfig setObject:[[Utils sharedUtils] addTextfieldImageBox] forKey:@"textField.rightView"];
    [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.rightViewMode"];
    [row.cellConfigAtConfigure setObject:@(NO) forKey:@"textField.userInteractionEnabled"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:@(TextfieldTagSuppJackets) forKey:@"textField.tag"];
    row.hidden = [NSString stringWithFormat:@"$%@ == 0", ModelFlyHasJackets];
    [section addFormRow:row];
    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghies rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Dinghies (D)"];
    [row.cellConfigAtConfigure setObject:AppColorLight forKey:@"switchControl.onTintColor"];
    row.value = @([[self.dicSupplementary valueForKey:ModelFlyDinghies] boolValue]);
    [section addFormRow:row];

    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Dinghies"];
    section.hidden = [NSString stringWithFormat:@"$%@ == 0", ModelFlyDinghies];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghiesNumber rowType:XLFormRowDescriptorTypeInteger title:@"Number"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:@(TextfieldTagSuppDinghiesNumber) forKey:@"textField.tag"];
    row.required = NO;
    row.value = [self.dicSupplementary valueForKey:ModelFlyDinghiesNumber] != nil ? [self.dicSupplementary valueForKey:ModelFlyDinghiesNumber] : nil;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"Fly %@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{0,2}$"]];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghiesCapacity rowType:XLFormRowDescriptorTypeInteger title:@"Capacity"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:@(TextfieldTagSuppDinghiesCapacity) forKey:@"textField.tag"];
    row.required = NO;
    row.value = [self.dicSupplementary valueForKey:ModelFlyDinghiesCapacity] != nil ? [self.dicSupplementary valueForKey:ModelFlyDinghiesCapacity] : nil;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"Fly %@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{0,4}$"]];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghiesHasCover rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Cover"];
    row.value = @([[self.dicSupplementary valueForKey:ModelFlyDinghiesHasCover] boolValue]);
    [row.cellConfigAtConfigure setObject:AppColorLight forKey:@"switchControl.onTintColor"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghiesCoverColor rowType:XLFormRowDescriptorTypeZipCode title:@"Colour"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = NO;
    row.value = [self.dicSupplementary valueForKey:ModelFlyDinghiesCoverColor] != nil ? [self.dicSupplementary valueForKey:ModelFlyDinghiesCoverColor] : nil;
    row.hidden = [NSString stringWithFormat:@"$%@ == 0", ModelFlyDinghiesHasCover];
    [section addFormRow:row];
    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyAircraftColor rowType:XLFormRowDescriptorTypeZipCode title:@"Aircraft color and marking (A)"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = NO;
    row.value = [self.dicSupplementary valueForKey:ModelFlyAircraftColor] != nil ? [self.dicSupplementary valueForKey:ModelFlyAircraftColor] : nil;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyHasRemakrs rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Remarks (N)"];
    row.value = @([[self.dicSupplementary valueForKey:ModelFlyHasRemakrs] boolValue]);
    [row.cellConfigAtConfigure setObject:AppColorLight forKey:@"switchControl.onTintColor"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyRemakrs rowType:XLFormRowDescriptorTypeZipCode title:@"Insert value"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = NO;
    row.value = [self.dicSupplementary valueForKey:ModelFlyRemakrs] != nil ? [self.dicSupplementary valueForKey:ModelFlyRemakrs] : nil;
    row.hidden = [NSString stringWithFormat:@"$%@ == 0", ModelFlyHasRemakrs];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyPilotInCommand rowType:XLFormRowDescriptorTypeZipCode title:@"Pilot in-command (C)"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = NO;
    row.value = [self.dicSupplementary valueForKey:ModelFlyPilotInCommand] != nil ? [self.dicSupplementary valueForKey:ModelFlyPilotInCommand] : nil;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyPilotLicence rowType:XLFormRowDescriptorTypeInfo];
    row.title = @"Licence (L)";
    row.required = NO;
    row.value = @"M240-CMD";
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
                
                if([row.tag isEqualToString:ModelFlyHasEmergencyRadio] || [row.tag isEqualToString:ModelFlyHasSurvivalEquipment] || [row.tag isEqualToString:ModelFlyHasJackets] || [row.tag isEqualToString:ModelFlyHasRemakrs]){
                    [self.dicSupplementary setValue:@([row.value boolValue]) forKey:row.tag];
                }else if([row.tag isEqualToString:ModelFlyEmergencyRadio] || [row.tag isEqualToString:ModelFlySurvivalEquipment] || [row.tag isEqualToString:ModelFlyJackets]){
                    NSArray* arrayOfStrings = [row.value componentsSeparatedByString:@","];
                    [self.dicSupplementary setValue:arrayOfStrings forKey:row.tag];
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

#pragma mark - Textfield Delegate - Real time limit character
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // Prevent crashing undo bug – see note below.
    if(range.length + range.location > textField.text.length){
        return NO;
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    if(textField.tag == TextfieldTagSuppDinghiesNumber){
        if(string.length > 0){
            NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:string];
            
            BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField] && (newLength <= 2);
            return stringIsValid;
        }
        return newLength <= 2;
    }else if(textField.tag == TextfieldTagSuppDinghiesCapacity){
        if(string.length > 0){
            NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:string];
            
            BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField] && (newLength <= 4);
            return stringIsValid;
        }
        return newLength <= 4;
    }else if(textField.tag == TextfieldTagSuppPersonOnBoard){
        if(string.length > 0){
            NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:string];
            
            BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField] && (newLength <= 3);
            return stringIsValid;
        }
        return newLength <= 3;
    }
    return newLength <= 100;
}


-(void)didSelectFormRow:(XLFormRowDescriptor *)formRow{
    [super didSelectFormRow:formRow];
    if([formRow.tag isEqualToString:ModelFlyEndurance]){
        if([rowEndurancePicker.hidden isEqual:@(YES)]){
            rowEndurancePicker.hidden = @(NO);
        }else{
            rowEndurancePicker.hidden = @(YES);
            formRow.value = [[Utils sharedUtils] timeFormatPicker:rowEndurancePicker.value];
            [self updateFormRow:formRow];
        }
    }else if([formRow.tag isEqualToString:ModelFlyEmergencyRadio] || [formRow.tag isEqualToString:ModelFlySurvivalEquipment] || [formRow.tag isEqualToString:ModelFlyJackets]){
        [self performSegueWithIdentifier:@"SegueCustomSelector" sender:formRow];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *segueId = segue.identifier;
    
    if ([segueId isEqualToString:@"SegueCustomSelector"]) {
        segueSelectedRow = sender;
        
        CustomSelectorViewController *vc = segue.destinationViewController;
        vc.delegate = self;
        vc.tag = segueSelectedRow.tag;
        if([segueSelectedRow.tag isEqualToString:ModelFlyEmergencyRadio] || [segueSelectedRow.tag isEqualToString:ModelFlySurvivalEquipment] || [segueSelectedRow.tag isEqualToString:ModelFlyJackets]){
            if(segueSelectedRow.value != nil){
                NSArray* arrayOfStrings = [segueSelectedRow.value componentsSeparatedByString:@","];
                vc.selectedOptions = [[NSMutableArray alloc] initWithArray:arrayOfStrings];
            }else{
                vc.selectedOptions = [[NSMutableArray alloc] init];
            }
        }else{
            vc.selectedOption = [segueSelectedRow.value displayText];
        }
    }
}

#pragma mark - Custom Delegates
-(void)delegateVC:(CustomSelectorViewController *)vc option:(NSMutableDictionary *)option{
    if([option valueForKey:@"selectedOptions"]){
        segueSelectedRow.value = [[option valueForKey:@"selectedOptions"] componentsJoinedByString:@","];
    }else{
        segueSelectedRow.value = [option valueForKey:@"selectedOption"];
    }
}
@end
