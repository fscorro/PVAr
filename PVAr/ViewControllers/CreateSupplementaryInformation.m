//
//  UIViewController+CreateSupplementaryInformation.m
//  PVAr
//
//  Created by Roberto Daviduk on 20/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "CreateSupplementaryInformation.h"
#import "Constants.h"

@interface CreateSupplementaryInformation(){
    NSMutableDictionary *dic;
}
@end

@implementation CreateSupplementaryInformation

-(void)viewDidLoad{
    [super viewDidLoad];
    
    dic = [[NSMutableDictionary alloc] init];
    
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
    row.required = NO;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"Fly %@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{0,4}$"]];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyPersonsOnBoard rowType:XLFormRowDescriptorTypeText title:@"Persons on board"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = NO;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyEmergencyRadio rowType:XLFormRowDescriptorTypeMultipleSelector title:@"Emergency radio"];
    row.selectorOptions = @[@"U",@"V",@"E"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlySurvivalEquipment rowType:XLFormRowDescriptorTypeMultipleSelector title:@"Survival equipment"];
    row.selectorOptions = @[@"S",@"P",@"M",@"J"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyJackets rowType:XLFormRowDescriptorTypeMultipleSelector title:@"Jackets"];
    row.selectorOptions = @[@"L",@"F",@"U",@"V"];
    [section addFormRow:row];
    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghies rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Dinghies"];
    row.value = @NO;
    [section addFormRow:row];

    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Dinghies"];
    section.hidden = [NSString stringWithFormat:@"$%@ == 0", ModelFlyDinghies];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghiesNumber rowType:XLFormRowDescriptorTypeText title:@"Number"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = NO;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"Fly %@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{0,2}$"]];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghiesCapacity rowType:XLFormRowDescriptorTypeText title:@"Capacity"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = NO;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"Fly %@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{0,4}$"]];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghiesHasCover rowType:XLFormRowDescriptorTypeBooleanSwitch title:@"Cover"];
    row.value = @NO;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyDinghiesCoverColor rowType:XLFormRowDescriptorTypeText title:@"Colour"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = NO;
    row.hidden = [NSString stringWithFormat:@"$%@ == 0", ModelFlyDinghiesHasCover];
    [section addFormRow:row];
    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyAircraftColor rowType:XLFormRowDescriptorTypeText title:@"Aircraft color and marking"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = NO;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyRemakrs rowType:XLFormRowDescriptorTypeText title:@"Remarks"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = NO;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyPilotInCommand rowType:XLFormRowDescriptorTypeText title:@"Pilot in-command"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = NO;
    [section addFormRow:row];
    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Aditional requirements."];
    [form addFormSection:section];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyAditionalRequirements rowType:XLFormRowDescriptorTypeTextView title:@"Notes"];
    row.required = NO;
    [section addFormRow:row];
    
    
    self.form = form;

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if ([self.delegate respondsToSelector:@selector(delegateVC:dicSupplementary:)]) {
        
        for(int i = 0; i < [[self.form formSections] count] ; i++){
            for (XLFormRowDescriptor *row in [[[self.form formSections] objectAtIndex:i] formRows]) {
                if([row.tag isEqualToString:ModelFlyEmergencyRadio]){
                    [dic setValue:row.value forKey:row.tag];
                }else if([row.tag isEqualToString:ModelFlySurvivalEquipment]){
                    [dic setValue:row.value forKey:row.tag];
                }else if([row.tag isEqualToString:ModelFlyJackets]){
                    [dic setValue:row.value forKey:row.tag];
                }else if([row.tag isEqualToString:ModelFlyDinghies]){
                    [dic setValue:@([row.value boolValue]) forKey:row.tag];
                }else if([row.tag isEqualToString:ModelFlyDinghiesHasCover]){
                    [dic setValue:@([row.value boolValue]) forKey:row.tag];
                }else{
                    [dic setValue:[row.value displayText] forKey:row.tag];
                }
            }
        }
        
        if([[dic objectForKey:ModelFlyDinghies] boolValue] == false){
            for (NSString *key in [dic allKeys]) {
                if([key containsString:[ModelFlyDinghies lowercaseString]]){
                    [dic removeObjectForKey:key];
                }
            }
        }
        
        [self.delegate delegateVC:self dicSupplementary:dic];
    }
}
@end
