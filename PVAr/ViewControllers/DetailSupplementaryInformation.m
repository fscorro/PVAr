//
//  UIViewController+DetailSupplementaryInformation.m
//  PVAr
//
//  Created by Roberto Daviduk on 20/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "DetailSupplementaryInformation.h"
#import "Constants.h"

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
    row.value = self.fly.endurance != nil ?  self.fly.endurance : @"None";
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyPersonsOnBoard rowType:XLFormRowDescriptorTypeText title:@"Persons on board"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.personsOnBoard != nil ?  self.fly.personsOnBoard : @"None";
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyOptions1 rowType:XLFormRowDescriptorTypeMultipleSelector title:@"Options"];
    row.selectorOptions = @[@"UHF",@"VHF",@"ELT"];
    row.value = self.fly.options1 != nil ?  self.fly.options1 : @[@"None"];
    row.disabled = @YES;
    [section addFormRow:row];
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyOptions2 rowType:XLFormRowDescriptorTypeMultipleSelector title:@"Options"];
    row.selectorOptions = @[@"Polar",@"Desert",@"Maritime",@"Jungle",@"Light",@"Fluores",@"UHF",@"VHF"];
    row.value = self.fly.options2 != nil ?  self.fly.options2 : @[@"None"];
    row.disabled = @YES;
    [section addFormRow:row];
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyNumberSupplementary rowType:XLFormRowDescriptorTypeText title:@"Number"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.numberSupplementary != nil ?  self.fly.numberSupplementary : @"None";
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyCapacity rowType:XLFormRowDescriptorTypeText title:@"Capacity"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.capacity != nil ?  self.fly.capacity : @"None";
    row.disabled = @YES;
    [section addFormRow:row];
    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyHasCover rowType:XLFormRowDescriptorTypeText title:@"Has cover"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.hasCover ?  @"Yes" : @"No";
    row.disabled = @YES;
    [section addFormRow:row];
//    [section addFormRow:[XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyHasCover rowType:XLFormRowDescriptorTypeBooleanCheck title:@"Has cover"]];
//    row.value = @(self.fly.hasCover);
//    row.disabled = @YES;

    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyCoverColor rowType:XLFormRowDescriptorTypeText title:@"Color"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.coverColor != nil ?  self.fly.coverColor : @"None";
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyAircraftColor rowType:XLFormRowDescriptorTypeText title:@"Aircraft color and marking"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.aircraftColor != nil ?  self.fly.aircraftColor : @"None";
    row.disabled = @YES;
    [section addFormRow:row];
    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Observations."];
    [form addFormSection:section];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyObservations rowType:XLFormRowDescriptorTypeTextView title:@"Notes"];
    row.value = self.fly.observations != nil ?  self.fly.observations : @"None";
    row.disabled = @YES;
    [section addFormRow:row];
    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyLicence rowType:XLFormRowDescriptorTypeText title:@"Licence"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.licence != nil ?  self.fly.licence : @"None";
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyLicenceNumber rowType:XLFormRowDescriptorTypeText title:@"Number"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.licenceNumber != nil ?  self.fly.licenceNumber : @"None";
    row.disabled = @YES;
    [section addFormRow:row];
    
    self.form = form;
    
}

@end
