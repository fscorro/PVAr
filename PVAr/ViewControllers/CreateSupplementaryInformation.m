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
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = NO;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyPersonsOnBoard rowType:XLFormRowDescriptorTypeText title:@"Persons on board"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = NO;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyOptions1 rowType:XLFormRowDescriptorTypeMultipleSelector title:@"Options"];
    row.selectorOptions = @[@"UHF",@"VHF",@"ELT"];
    [section addFormRow:row];
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyOptions2 rowType:XLFormRowDescriptorTypeMultipleSelector title:@"Options"];
    row.selectorOptions = @[@"Polar",@"Desert",@"Maritime",@"Jungle",@"Light",@"Fluores",@"UHF",@"VHF"];
    [section addFormRow:row];
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyNumberSupplementary rowType:XLFormRowDescriptorTypeText title:@"Number"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = NO;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyCapacity rowType:XLFormRowDescriptorTypeText title:@"Capacity"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = NO;
    [section addFormRow:row];
    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section];
    
    // check
    [section addFormRow:[XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyHasCover rowType:XLFormRowDescriptorTypeBooleanCheck title:@"Has cover"]];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyCoverColor rowType:XLFormRowDescriptorTypeText title:@"Color"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = NO;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyAircraftColor rowType:XLFormRowDescriptorTypeText title:@"Aircraft color and marking"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = NO;
    [section addFormRow:row];
    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Observations."];
    [form addFormSection:section];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyObservations rowType:XLFormRowDescriptorTypeTextView title:@"Notes"];
    row.required = NO;
    [section addFormRow:row];
    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyLicence rowType:XLFormRowDescriptorTypeText title:@"Licence"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = NO;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyLicenceNumber rowType:XLFormRowDescriptorTypeText title:@"Number"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = NO;
    [section addFormRow:row];
    
    self.form = form;

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if ([self.delegate respondsToSelector:@selector(delegateVC:dicSupplementary:)]) {
        
        for(int i = 0; i < [[self.form formSections] count] ; i++){
            for (XLFormRowDescriptor *row in [[[self.form formSections] objectAtIndex:i] formRows]) {
                if([row.tag isEqualToString:ModelFlyOptions1]){
                    [dic setValue:row.value forKey:row.tag];
                }else if([row.tag isEqualToString:ModelFlyOptions2]){
                    // convertir fecha a string o enviar en formato fecha
                    [dic setValue:row.value forKey:row.tag];
                }else if([row.tag isEqualToString:ModelFlyHasCover]){
                    [dic setValue:@([row.value boolValue]) forKey:row.tag];
                }else{
                    [dic setValue:[row.value displayText] forKey:row.tag];
                }
            }
        }
        
        [self.delegate delegateVC:self dicSupplementary:dic];
    }
}
@end
