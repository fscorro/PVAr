//
//  UITableViewCell+CreateSimplifiedFPLViewController.m
//  PVAr
//
//  Created by Roberto Daviduk on 20/7/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "CreateSimplifiedFPLViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "ShowAlert.h"

typedef NS_ENUM(NSInteger, CustomSelector) {
    CrouissingSpeed = 0,
    Level
};

typedef NS_ENUM(NSInteger, DateStatus) {
    DateStatusEqual = 0,
    DateStatusLater,
    DateStatusEarlier
};

typedef NS_ENUM(NSInteger, TextfieldTag) {
    TextfieldTagAeroplaneIdentifier = 1,
    TextfieldTagRule,
    TextfieldTagType,
    TextfieldTagCategory,
    TextfieldTagAeroplaneNumber,
    TextfieldTagAeroplaneType,
    TextfieldTagEquipment,
    TextfieldTagOrigin,
    TextfieldTagDestination,
    TextfieldTagSpeedUnit,
    TextfieldTagSpeed,
    TextfieldTagLevelUnit,
    TextfieldTagLevel,
    TextfieldTagRoute,
    TextfieldTagAlternative,
    TextfieldTagEET,
    TextfieldTagInfo
};

@interface CreateSimplifiedFPLViewController(){
    NSMutableArray *oldValidation;
    NSMutableDictionary *dicSupp;
    
    XLFormRowDescriptor * rowTotalEETPicker;
    
    XLFormRowDescriptor *rowSpeedUnit;
    XLFormRowDescriptor *rowLevelUnit;
    XLFormRowDescriptor *segueSelectedRow;
    
    BOOL invalidDate;
}
@end

@implementation CreateSimplifiedFPLViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    oldValidation = [[NSMutableArray alloc] init];
    
    [self initializeForm];
}

-(void)initializeForm{
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [XLFormDescriptor formDescriptor];
    
    // SECTION 2
    section = [XLFormSectionDescriptor formSectionWithTitle:@"AIRCRAFT INFORMATION"];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyaeroplaneID rowType:XLFormRowDescriptorTypeZipCode title:@"Identifier"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    [row.cellConfig setObject:@(TextfieldTagAeroplaneIdentifier) forKey:@"textField.tag"];
    row.required = YES;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"Aircraft %@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{1,7}$"]];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyrule rowType:XLFormRowDescriptorTypeZipCode title:@"Rule"];
    row.value = [[Utils sharedUtils] returnStringSeparateBy:@" - " fromString:[[[Utils sharedUtils] loadDataFromPlist:PlistSelectorValuesName withKey:PlistSelectorValuesKeyFlyRule] objectAtIndex:0]];
    [row.cellConfig setObject:[[Utils sharedUtils] addTextfieldImageBox] forKey:@"textField.rightView"];
    [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.rightViewMode"];
    [row.cellConfigAtConfigure setObject:@(NO) forKey:@"textField.userInteractionEnabled"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:@(TextfieldTagRule) forKey:@"textField.tag"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlytype rowType:XLFormRowDescriptorTypeZipCode title:@"Type"];
    row.value = [[Utils sharedUtils] returnStringSeparateBy:@" - " fromString:[[[Utils sharedUtils] loadDataFromPlist:PlistSelectorValuesName withKey:PlistSelectorValuesKeyFlyType] objectAtIndex:0]];
    [row.cellConfig setObject:[[Utils sharedUtils] addTextfieldImageBox] forKey:@"textField.rightView"];
    [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.rightViewMode"];
    [row.cellConfigAtConfigure setObject:@(NO) forKey:@"textField.userInteractionEnabled"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:@(TextfieldTagType) forKey:@"textField.tag"];
    [section addFormRow:row];
    
    
    // SECTION 2
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyaeroplaneNumber rowType:XLFormRowDescriptorTypeZipCode title:@"Number"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    [row.cellConfig setObject:@(TextfieldTagAeroplaneNumber) forKey:@"textField.tag"];
    row.required = YES;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"Aircraft %@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{1,2}$"]];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyaeroplaneType rowType:XLFormRowDescriptorTypeZipCode title:@"Type"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    [row.cellConfig setObject:@(TextfieldTagAeroplaneType) forKey:@"textField.tag"];
    row.required = YES;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"Aircraft %@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{1,4}$"]];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlycategory rowType:XLFormRowDescriptorTypeZipCode title:@"Category"];
    row.value = [[Utils sharedUtils] returnStringSeparateBy:@" - " fromString:[[[Utils sharedUtils] loadDataFromPlist:PlistSelectorValuesName withKey:PlistSelectorValuesKeyFlyCategory] objectAtIndex:0]];
    [row.cellConfig setObject:[[Utils sharedUtils] addTextfieldImageBox] forKey:@"textField.rightView"];
    [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.rightViewMode"];
    [row.cellConfigAtConfigure setObject:@(NO) forKey:@"textField.userInteractionEnabled"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:@(TextfieldTagCategory) forKey:@"textField.tag"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyequipment rowType:XLFormRowDescriptorTypeZipCode title:@"Equipment"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:@(TextfieldTagEquipment) forKey:@"textField.tag"];
    row.required = NO;
    [section addFormRow:row];
    
    
    // SECTION 3
    section = [XLFormSectionDescriptor formSectionWithTitle:@"FLY INFORMATION"];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyoriginAerodrome rowType:XLFormRowDescriptorTypeZipCode title:@"Origin aerodrome"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    [row.cellConfig setObject:@(TextfieldTagOrigin) forKey:@"textField.tag"];
    row.required = YES;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"%@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{1,8}$"]];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlydateTime rowType:XLFormRowDescriptorTypeDateTimeInline title:@"Date Time"];
    row.value = [NSDate new];
    invalidDate = true;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlydestinationAerodrome rowType:XLFormRowDescriptorTypeZipCode title:@"Destination aerodrome"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    [row.cellConfig setObject:@(TextfieldTagDestination) forKey:@"textField.tag"];
    row.required = YES;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"%@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{1,4}$"]];
    [section addFormRow:row];
    
    // SECTION 5 - Alternative fly
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Alternatives"
                                             sectionOptions:XLFormSectionOptionCanReorder | XLFormSectionOptionCanInsert | XLFormSectionOptionCanDelete
                                          sectionInsertMode:XLFormSectionInsertModeButton];
    section.multivaluedAddButton.title = @"Add Fly Alternative";
    [section.multivaluedAddButton.cellConfig setObject:AppColorLight forKey:@"textLabel.color"];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyalternative rowType:XLFormRowDescriptorTypeZipCode];
    [row.cellConfig setObject:@"..." forKey:@"textField.placeholder"];
    [row.cellConfig setObject:@(TextfieldTagAlternative) forKey:@"textField.tag"];
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"%@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{0,4}$"]];
    section.multivaluedRowTemplate = row;
    [form addFormSection:section];
    
    // SECTION 6
    section = [XLFormSectionDescriptor formSectionWithTitle:nil];
    [form addFormSection:section];
    
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyEET rowType:XLFormRowDescriptorTypeZipCode title:@"Total EET"];
    [row.cellConfigAtConfigure setObject:@(NO) forKey:@"textField.userInteractionEnabled"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    [row.cellConfig setObject:@(TextfieldTagEET) forKey:@"textField.tag"];
    row.required = YES;
    [section addFormRow:row];
    
    rowTotalEETPicker = [XLFormRowDescriptor formRowDescriptorWithTag:@"rowTotalEETPicker" rowType:XLFormRowDescriptorTypeDatePicker];
    [rowTotalEETPicker.cellConfigAtConfigure setObject:@(UIDatePickerModeCountDownTimer) forKey:@"datePicker.datePickerMode"];
    rowTotalEETPicker.hidden = @(YES);
    NSDateComponents * dateComp = [NSDateComponents new];
    dateComp.hour = 0;
    dateComp.minute = 7;
    dateComp.timeZone = [NSTimeZone systemTimeZone];
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    rowTotalEETPicker.value = [calendar dateFromComponents:dateComp];
    [section addFormRow:rowTotalEETPicker];
    
    
    rowSpeedUnit = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyspeedUnit rowType:XLFormRowDescriptorTypeZipCode title:@"Cruissing speed"];
    rowSpeedUnit.value = [[Utils sharedUtils] returnStringSeparateBy:@" - " fromString:[[[Utils sharedUtils] loadDataFromPlist:PlistSelectorValuesName withKey:PlistSelectorValuesKeyFlySpeed] objectAtIndex:0]];
    [rowSpeedUnit.cellConfig setObject:[[Utils sharedUtils] addTextfieldImageBox] forKey:@"textField.rightView"];
    [rowSpeedUnit.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.rightViewMode"];
    [rowSpeedUnit.cellConfigAtConfigure setObject:@(NO) forKey:@"textField.userInteractionEnabled"];
    [rowSpeedUnit.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [rowSpeedUnit.cellConfig setObject:@(TextfieldTagSpeedUnit) forKey:@"textField.tag"];
    [section addFormRow:rowSpeedUnit];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyspeed rowType:XLFormRowDescriptorTypeInteger title:@"Insert speed"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    [row.cellConfig setObject:@(TextfieldTagSpeed) forKey:@"textField.tag"];
    row.required = YES;
    [section addFormRow:row];
    
    rowLevelUnit = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlylevelUnit rowType:XLFormRowDescriptorTypeZipCode title:@"Level"];
    rowLevelUnit.value = [[Utils sharedUtils] returnStringSeparateBy:@" - " fromString:[[[Utils sharedUtils] loadDataFromPlist:PlistSelectorValuesName withKey:PlistSelectorValuesKeyFlyLevel] objectAtIndex:0]];
    [rowLevelUnit.cellConfig setObject:[[Utils sharedUtils] addTextfieldImageBox] forKey:@"textField.rightView"];
    [rowLevelUnit.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.rightViewMode"];
    [rowLevelUnit.cellConfigAtConfigure setObject:@(NO) forKey:@"textField.userInteractionEnabled"];
    [rowLevelUnit.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [rowLevelUnit.cellConfig setObject:@(TextfieldTagLevelUnit) forKey:@"textField.tag"];
    [section addFormRow:rowLevelUnit];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlylevel rowType:XLFormRowDescriptorTypeInteger title:@"Insert level"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    [row.cellConfig setObject:@(TextfieldTagLevel) forKey:@"textField.tag"];
    row.required = YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyroute rowType:XLFormRowDescriptorTypeTextView title:@"Route"];
    row.required = NO;
    [section addFormRow:row];
    
    
    // SECTION 7
    section = [XLFormSectionDescriptor formSectionWithTitle:@"More util information."];
    [form addFormSection:section];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyinformation rowType:XLFormRowDescriptorTypeTextView title:@"Notes"];
    row.required = NO;
    [section addFormRow:row];
    
    
    // SECTION SUPPLEMENTARY INFORMATION
    section = [XLFormSectionDescriptor formSectionWithTitle:nil];
    XLFormRowDescriptor * buttonWithSegueId = [XLFormRowDescriptor formRowDescriptorWithTag:@"SuplementaryInfo" rowType:XLFormRowDescriptorTypeButton title:@"Supplementary Information"];
    buttonWithSegueId.action.formSegueIdentifier = @"SegueSupplementaryInformation";
    [section addFormRow:buttonWithSegueId];
    [form addFormSection:section];
    
    
    // SECTION BUTTON
    section = [XLFormSectionDescriptor formSectionWithTitle:nil];
    [form addFormSection:section];
    
    XLFormRowDescriptor * buttonRow = [XLFormRowDescriptor formRowDescriptorWithTag:KButtonCreateFPL rowType:XLFormRowDescriptorTypeButton title:@"Create FPL"];
    buttonRow.action.formSelector = @selector(CreateFPL:);
    [buttonRow.cellConfig setObject:AppColorLight forKey:@"textLabel.color"];
    
    [section addFormRow:buttonRow];
    
    self.form = form;
    
}

#pragma mark - XLFormDescriptorDelegate

-(void)formRowDescriptorValueHasChanged:(XLFormRowDescriptor *)rowDescriptor oldValue:(id)oldValue newValue:(id)newValue{
    [super formRowDescriptorValueHasChanged:rowDescriptor oldValue:oldValue newValue:newValue];
    
    if ([rowDescriptor.tag isEqualToString:ModelFlydateTime]){
        
        XLFormRowDescriptor * startDateDescriptor = [self.form formRowWithTag:ModelFlydateTime];
        
        XLFormDateCell * dateCell = (XLFormDateCell *)[startDateDescriptor cellForFormController:self];
        if ([[NSDate new] compare:startDateDescriptor.value] == NSOrderedDescending) {
            // startDateDescriptor is later than endDateDescriptor
            [dateCell update]; // force detailTextLabel update
            NSDictionary *strikeThroughAttribute = [NSDictionary dictionaryWithObject:@1
                                                                               forKey:NSStrikethroughStyleAttributeName];
            NSAttributedString* strikeThroughText = [[NSAttributedString alloc] initWithString:dateCell.detailTextLabel.text attributes:strikeThroughAttribute];
            [startDateDescriptor.cellConfig setObject:strikeThroughText forKey:@"detailTextLabel.attributedText"];
            [self updateFormRow:startDateDescriptor];
            invalidDate = true;
        }
        else{
            [startDateDescriptor.cellConfig removeObjectForKey:@"detailTextLabel.attributedText"];
            [self updateFormRow:startDateDescriptor];
            invalidDate = false;
        }
    }
}

-(void)formRowHasBeenAdded:(XLFormRowDescriptor *)formRow atIndexPath:(NSIndexPath *)indexPath{
    [super formRowHasBeenAdded:formRow atIndexPath:indexPath];
    
    //Disable add Row if is neccesary
    NSInteger rowCount = indexPath.row + 1;
    if (rowCount == maxAlternativesDestination) {
        NSIndexPath *addIndexPath = [NSIndexPath indexPathForRow:rowCount inSection:indexPath.section];
        XLFormRowDescriptor * row = [self.form formRowAtIndex:addIndexPath];
        row.disabled = @YES;
        
        [self.tableView reloadRowsAtIndexPaths:@[addIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
    
}
-(void)formRowHasBeenRemoved:(XLFormRowDescriptor *)formRow atIndexPath:(NSIndexPath *)indexPath{
    [super formRowHasBeenRemoved:formRow atIndexPath:indexPath];
    
    NSInteger rowCount = indexPath.row;
    if (rowCount < maxAlternativesDestination) {
        NSIndexPath *addIndexPath = [NSIndexPath indexPathForRow:rowCount inSection:indexPath.section];
        XLFormRowDescriptor * row = [self.form formRowAtIndex:addIndexPath];
        row.disabled = @NO;
        
        [self.tableView reloadRowsAtIndexPaths:@[addIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
}

-(void)CreateFPL:(XLFormRowDescriptor *)sender{
    
    NSArray * validationErrors = [self formValidationErrors];
    if (validationErrors.count > 0){
        [RKDropdownAlert title:@"Submit failure" message:[[validationErrors firstObject] localizedDescription] backgroundColor:AlertColorError textColor:[UIColor whiteColor] time:3];
        [self deselectFormRow:sender];
        return;
    }
    
    if(invalidDate == true){
        [RKDropdownAlert title:@"Submit failure" message:@"Verify selected date" backgroundColor:AlertColorError textColor:[UIColor whiteColor] time:3];
        [self deselectFormRow:sender];
        return;
    }
    
    if([validationErrors count] == 0){
        NSMutableDictionary *temp = [[NSMutableDictionary alloc] init];
        [temp setValue:@"P" forKey:ModelFlystate];
        [temp setValue:@(1) forKey:ModelFlyCreationType];

        NSMutableArray *arrAlternatives = [[NSMutableArray alloc] init];
        
        for(int i = 0; i < [[self.form formSections] count] ; i++){
            for (XLFormRowDescriptor *row in [[[self.form formSections] objectAtIndex:i] formRows]) {
                if([row.rowType isEqualToString:XLFormRowDescriptorTypeSelectorPush]){
                    [temp setValue:[row.value displayText] forKey:row.tag];
                }else if([row.rowType isEqualToString:XLFormRowDescriptorTypeDateInline] || [row.rowType isEqualToString:XLFormRowDescriptorTypeTimeInline]){
                    [temp setValue:row.value forKey:row.tag];
                }else if(row.tag == nil){
                    if (row.value != nil) {
                        [arrAlternatives addObject:row.value];
                        [temp setValue:arrAlternatives forKey:ModelFlyalternative];
                    }
                }else{
                    if (row.value != nil) {
                        if([row.tag isEqualToString:ModelFlyspeed]||[row.tag isEqualToString:ModelFlylevel]){
                            [temp setValue:[row.value displayText] forKey:row.tag];
                        }else{
                            [temp setValue:row.value forKey:row.tag];
                        }
                    }
                }
            }
        }
        
        if([arrAlternatives count] == 0){
            [RKDropdownAlert title:@"Submit failure" message:@"Enter at less one alternative destination" backgroundColor:AlertColorError textColor:[UIColor whiteColor] time:3];
            [self deselectFormRow:sender];
            return;
        }
        
        [temp setValue:dicSupp forKey:ModelFlySupplementaryDictionary];
        Fly *newFly = [[Fly alloc] initWithDict:temp];
        
        [ShowAlert ShowAlertWithTitle:@"Submit Successfull" andMessage:@"Your FPL was created successfully" acceptBlock:^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadPendingFPL" object:newFly];
            
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }
    
    [self deselectFormRow:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *segueId = segue.identifier;
    
    if ([segueId isEqualToString:@"SegueSupplementaryInformation"]) {
        SuppInfoSimplifiedFPLViewController *vc = segue.destinationViewController;
        vc.delegate = self;
        vc.dicSupplementary = dicSupp;
    }else if ([segueId isEqualToString:@"SegueCustomSelector"]) {
        segueSelectedRow = sender;
        
        CustomSelectorViewController *vc = segue.destinationViewController;
        vc.delegate = self;
        vc.tag = segueSelectedRow.tag;
        vc.selectedOption = [segueSelectedRow.value displayText];
    }
}

-(void)didSelectFormRow:(XLFormRowDescriptor *)formRow{
    [super didSelectFormRow:formRow];
    if([formRow.tag isEqualToString:ModelFlyEET]){
        if([rowTotalEETPicker.hidden isEqual:@(YES)]){
            rowTotalEETPicker.hidden = @(NO);
        }else{
            rowTotalEETPicker.hidden = @(YES);
            formRow.value = [[Utils sharedUtils] timeFormatPicker:rowTotalEETPicker.value];
            [self updateFormRow:formRow];
        }
    }else if([formRow.tag isEqualToString:ModelFlyrule] || [formRow.tag isEqualToString:ModelFlytype] || [formRow.tag isEqualToString:ModelFlycategory] || [formRow.tag isEqualToString:ModelFlyspeedUnit] || [formRow.tag isEqualToString:ModelFlylevelUnit]){
        [self performSegueWithIdentifier:@"SegueCustomSelector" sender:formRow];
    }
}

#pragma mark - Textfield Delegate - Real time limit character
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // Prevent crashing undo bug – see note below.
    if(range.length + range.location > textField.text.length){
        return NO;
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    if(textField.tag == TextfieldTagAeroplaneIdentifier){
        if(string.length > 0){
            NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"];
            NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:string];
            
            BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField] && (newLength <= 7);
            return stringIsValid;
        }
        return newLength <= 7;
    }else if(textField.tag == TextfieldTagAeroplaneNumber){
        if(string.length > 0){
            NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"];
            NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:string];
            
            BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField] && (newLength <= 2);
            return stringIsValid;
        }
        return newLength <= 2;
    }else if(textField.tag == TextfieldTagAeroplaneType){
        if(string.length > 0){
            NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"];
            NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:string];
            
            BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField] && (newLength <= 4);
            return stringIsValid;
        }
        return newLength <= 4;
    }else if(textField.tag == TextfieldTagOrigin){
        if(string.length > 0){
            NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"];
            NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:string];
            
            BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField] && (newLength <= 8);
            return stringIsValid;
        }
        return newLength <= 8;
    }else if(textField.tag == TextfieldTagDestination || textField.tag == TextfieldTagSpeed || textField.tag == TextfieldTagLevel || textField.tag == TextfieldTagAlternative){
        if(string.length > 0){
            NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"];
            NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:string];
            
            BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField] && (newLength <= 4);
            return stringIsValid;
        }
        return newLength <= 4;
    }
    return newLength <= 50;
}

#pragma mark - Custom Delegates
-(void)delegateVC:(SuppInfoSimplifiedFPLViewController *)vc dicSupplementary:(NSMutableDictionary *)dic{
    dicSupp = [[NSMutableDictionary alloc] initWithDictionary:dic];
}

-(void)delegateVC:(CustomSelectorViewController *)vc option:(NSMutableDictionary *)option{
    if([option valueForKey:@"selectedOptions"]){
        segueSelectedRow.value = [option valueForKey:@"selectedOptions"];
    }else{
        segueSelectedRow.value = [option valueForKey:@"selectedOption"];
    }
}
@end
