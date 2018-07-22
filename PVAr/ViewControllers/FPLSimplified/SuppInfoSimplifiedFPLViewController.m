//
//  UITableViewCell+SuppInfoSimplifiedFPLViewController.m
//  PVAr
//
//  Created by Roberto Daviduk on 20/7/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "SuppInfoSimplifiedFPLViewController.h"
#import "Constants.h"
#import "Utils.h"

typedef NS_ENUM(NSInteger, TextfieldTagSupp) {
    TextfieldTagSuppEndurance = 1,
    TextfieldTagSuppPersonOnBoard
};

@interface SuppInfoSimplifiedFPLViewController(){
    XLFormRowDescriptor * rowEndurancePicker;
}
@end

@implementation SuppInfoSimplifiedFPLViewController

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
    
    self.form = form;
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if ([self.delegate respondsToSelector:@selector(delegateVC:dicSupplementary:)]) {
        
        for(int i = 0; i < [[self.form formSections] count] ; i++){
            for (XLFormRowDescriptor *row in [[[self.form formSections] objectAtIndex:i] formRows]) {
                [self.dicSupplementary setValue:[row.value displayText] forKey:row.tag];
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
    if(textField.tag == TextfieldTagSuppPersonOnBoard){
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
    }
}

@end
