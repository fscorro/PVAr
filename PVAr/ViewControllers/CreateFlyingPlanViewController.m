//
//  UIViewController+CreateFlyingPlanViewController.m
//  PVAr
//
//  Created by Prisma on 14/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "CreateFlyingPlanViewController.h"
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

NSString *const KButtonCreateFPL = @"FLPButton";

NSInteger const maxAlternativesDestination = 2;

@interface CreateFlyingPlanViewController(){
    NSMutableArray *oldValidation;
    NSMutableDictionary *dicSupp;
    
    UIButton *buttonCruissingSpeed;
    UIButton *buttonLevel;
    BOOL cruissingSpeedSelector;
    
    BOOL invalidDate;
}
@end

@implementation CreateFlyingPlanViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    oldValidation = [[NSMutableArray alloc] init];
    
    [self initializeForm];
}

-(void)initializeForm{
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [XLFormDescriptor formDescriptor];
    
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyrule rowType:XLFormRowDescriptorTypeSelectorPush title:@"Rule"];
//    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"I"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"V"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Y"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Z"]
//                            ];
//    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"I"];
//    [section addFormRow:row];
//
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlytype rowType:XLFormRowDescriptorTypeSelectorPush title:@"Type"];
//    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"S"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"N"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"G"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"M"],
//                            [XLFormOptionsObject formOptionsObjectWithValue:@(5) displayText:@"X"]
//                            ];
//    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"S"];
//    [section addFormRow:row];
    
    
    // SECTION 2
    section = [XLFormSectionDescriptor formSectionWithTitle:@"AEROPLANE INFORMATION"];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyaeroplaneNumber rowType:XLFormRowDescriptorTypeZipCode title:@"Number"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"Aeroplane %@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{1,2}$"]];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyaeroplaneType rowType:XLFormRowDescriptorTypeZipCode title:@"Type"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"Aeroplane %@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{1,4}$"]];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlycategory rowType:XLFormRowDescriptorTypeSelectorPush title:@"Category"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"L"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"M"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"H"]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"L"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyequipment rowType:XLFormRowDescriptorTypeZipCode title:@"Equipment"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [section addFormRow:row];
    
    
    // SECTION 3
    section = [XLFormSectionDescriptor formSectionWithTitle:nil];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyoriginAerodrome rowType:XLFormRowDescriptorTypeZipCode title:@"Origin aerodrome"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"%@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{1,8}$"]];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlydestinationAerodrome rowType:XLFormRowDescriptorTypeZipCode title:@"Destination aerodrome"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"%@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{1,4}$"]];
    [section addFormRow:row];

    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlydateTime rowType:XLFormRowDescriptorTypeDateTimeInline title:@"Date Time"];
    row.value = [NSDate new];
    invalidDate = true;
    [section addFormRow:row];
    
    buttonCruissingSpeed = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonCruissingSpeed addTarget:self action:@selector(ShowCustomSelector:) forControlEvents:UIControlEventTouchUpInside];
    [buttonCruissingSpeed setTitle:@"K" forState:UIControlStateNormal];
    [buttonCruissingSpeed setBackgroundColor:AppColorLight];
    buttonCruissingSpeed.tag = CrouissingSpeed;
    buttonCruissingSpeed.frame = CGRectMake(0.0, 0.0, 44.0, 44.0);
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyspeed rowType:XLFormRowDescriptorTypeZipCode title:@"Cruissing speed"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    [row.cellConfig setObject:buttonCruissingSpeed forKey:@"textField.leftView"];
    [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.leftViewMode"];
    row.required = YES;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"%@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{1,4}$"]];
    [section addFormRow:row];
    
    buttonLevel = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonLevel addTarget:self action:@selector(ShowCustomSelector:) forControlEvents:UIControlEventTouchUpInside];
    [buttonLevel setTitle:@"F" forState:UIControlStateNormal];
    [buttonLevel setBackgroundColor:AppColorLight];
    buttonLevel.tag = Level;
    buttonLevel.frame = CGRectMake(0.0, 0.0, 44.0, 44.0);
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlylevel rowType:XLFormRowDescriptorTypeZipCode title:@"Level"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    [row.cellConfig setObject:buttonLevel forKey:@"textField.leftView"];
    [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.leftViewMode"];
    row.required = YES;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"%@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{1,4}$"]];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyroute rowType:XLFormRowDescriptorTypeTextView title:@"Route"];
    row.required = NO;
    [section addFormRow:row];

    
    // SECTION 5 - Alternative fly
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Alternatives"
                                             sectionOptions:XLFormSectionOptionCanReorder | XLFormSectionOptionCanInsert | XLFormSectionOptionCanDelete
                                          sectionInsertMode:XLFormSectionInsertModeButton];
    section.multivaluedAddButton.title = @"Add Fly Alternative";
    [section.multivaluedAddButton.cellConfig setObject:AppColorLight forKey:@"textLabel.color"];

    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyalternative rowType:XLFormRowDescriptorTypeZipCode];
    [[row cellConfig] setObject:@"..." forKey:@"textField.placeholder"];
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"%@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{1,4}$"]];
    section.multivaluedRowTemplate = row;
    [form addFormSection:section];
    
    
    // SECTION 6
    section = [XLFormSectionDescriptor formSectionWithTitle:nil];
    [form addFormSection:section];
    
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyEET rowType:XLFormRowDescriptorTypeZipCode title:@"Total EET"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:[NSString stringWithFormat:@"%@: invalid value.",row.title] regex:@"^[a-zA-Z0-9].{1,8}$"]];
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
                        if([row.tag isEqualToString:ModelFlyspeed]){
                            [temp setValue:[NSString stringWithFormat:@"%@%@",buttonCruissingSpeed.titleLabel.text,row.value] forKey:row.tag];
                        }else if([row.tag isEqualToString:ModelFlylevel]){
                            [temp setValue:[NSString stringWithFormat:@"%@%@",buttonLevel.titleLabel.text,row.value] forKey:row.tag];
                        }else{
                            [temp setValue:row.value forKey:row.tag];
                        }
                    }
                }
            }
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
        CreateSupplementaryInformation *vc = segue.destinationViewController;
        vc.delegate = self;
        vc.dicSupplementary = dicSupp;
    }else if ([segueId isEqualToString:@"SegueCustomSelector"]) {
        CustomSelectorViewController *vc = segue.destinationViewController;
        vc.delegate = self;
        vc.selectedOption = cruissingSpeedSelector == true ? buttonCruissingSpeed.titleLabel.text : buttonLevel.titleLabel.text;
        vc.tag = cruissingSpeedSelector == true ? ModelFlyspeed : ModelFlylevel;
    }
}

-(void) ShowCustomSelector:(UIButton*)sender{
    switch (sender.tag) {
        case CrouissingSpeed:
            cruissingSpeedSelector = true;
            break;
        case Level:
            cruissingSpeedSelector = false;
            break;
    }
    [self performSegueWithIdentifier:@"SegueCustomSelector" sender:self];
}

-(void)delegateVC:(CreateSupplementaryInformation *)vc dicSupplementary:(NSMutableDictionary *)dic{
    dicSupp = [[NSMutableDictionary alloc] initWithDictionary:dic];
}
-(void)delegateVC:(CustomSelectorViewController *)vc option:(NSString *)option{
    if(cruissingSpeedSelector == true){
        [buttonCruissingSpeed setTitle:option forState:UIControlStateNormal];
    }else{
        [buttonLevel setTitle:option forState:UIControlStateNormal];
    }
}
@end
