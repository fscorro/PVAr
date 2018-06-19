//
//  UIViewController+CreateFlyingPlanViewController.m
//  PVAr
//
//  Created by Prisma on 14/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "CreateFlyingPlanViewController.h"
#import "Constants.h"
#import "ShowAlert.h"

//NSString *const KNumber = @"KNumber";
//NSString *const KPriority = @"KPriority";
//NSString *const KEnrollment = @"KEnrollment";
//NSString *const KCompany = @"KCompany";
//NSString *const Krule = @"Krule";
//NSString *const KType = @"KType";
//
//NSString *const KAeroplaneNumber = @"KAeroplaneNumber";
//NSString *const KAeroplaneType = @"KAeroplaneType";
//NSString *const KCategory = @"KCategory";
//NSString *const KEquipment = @"KEquipment";
//
//NSString *const KAerodrome = @"KAerodrome";
//NSString *const KDateTime = @"KDateTime";
//NSString *const KUnit = @"KUnit";
//NSString *const KSpeed = @"KSpeed";
//NSString *const KLevel = @"KLevel";
//
//NSString *const KOrigin = @"KOrigin";
//NSString *const KDestination = @"KDestination";
//NSString *const KAlternative = @"KAlternative";
//NSString *const KTotalEET = @"KTotalEET";
//
//NSString *const KMoreInfo = @"KMoreInfo";

NSString *const KButtonCreateFPL = @"FLPButton";

NSInteger const maxAlternativesDestination = 2;

@interface CreateFlyingPlanViewController(){

}
@end

@implementation CreateFlyingPlanViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self initializeForm];
}

-(void)initializeForm{
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [XLFormDescriptor formDescriptor];
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"FLY INFORMATION"];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlynumber rowType:XLFormRowDescriptorTypeEmail title:@"Number"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlypriority rowType:XLFormRowDescriptorTypeSelectorPush title:@"Priority"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"ALTRV"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"ATFMX"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"FFR"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"FLTCK"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(5) displayText:@"HAZMAT"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(6) displayText:@"HEAD"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(7) displayText:@"HOSP"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(8) displayText:@"HUM"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(9) displayText:@"MARSA"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(10) displayText:@"MEDEVAC"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(11) displayText:@"NONRVSM"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(12) displayText:@"SAR"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(13) displayText:@"STATUS"]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"ALTRV"];
    [section addFormRow:row];
   
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyenrollment rowType:XLFormRowDescriptorTypeEmail title:@"Enrollment"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlycompany rowType:XLFormRowDescriptorTypeEmail title:@"Company"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyrule rowType:XLFormRowDescriptorTypeSelectorPush title:@"Rule"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"I - Vuelo con IFR"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"V - Vuelo con VFR"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Y - IFR con cambio de regla de vuelo"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Z - VFR con cambio de regla de vuelo"]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"I - Vuelo con IFR"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlytype rowType:XLFormRowDescriptorTypeSelectorPush title:@"Type"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"S - Regular"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"N - No regular"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"G - General"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"M - Militar"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(5) displayText:@"X - Otra"]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"S - Regular"];
    [section addFormRow:row];
    
    
    // SECTION 2
    section = [XLFormSectionDescriptor formSectionWithTitle:@"AEROPLANE INFORMATION"];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyaeroplaneNumber rowType:XLFormRowDescriptorTypeEmail title:@"Number"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyaeroplaneType rowType:XLFormRowDescriptorTypeEmail title:@"Type"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlycategory rowType:XLFormRowDescriptorTypeSelectorPush title:@"Category"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"H - Pesada"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"M - Media"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"L - Liviana"]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"H - Pesada"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyequipment rowType:XLFormRowDescriptorTypeEmail title:@"Equipment"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [section addFormRow:row];
    
    
    // SECTION 3
    section = [XLFormSectionDescriptor formSectionWithTitle:nil];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyaerodrome rowType:XLFormRowDescriptorTypeEmail title:@"Aerodrome"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlydateTime rowType:XLFormRowDescriptorTypeDateTimeInline title:@"Date Time"];
    row.value = [NSDate new];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyunit rowType:XLFormRowDescriptorTypeSelectorPush title:@"Units"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"K - Kilometros"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"N - Nodos"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"M - Número de Mach"]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"K - Kilometros"];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyspeed rowType:XLFormRowDescriptorTypeEmail title:@"Speed"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlylevel rowType:XLFormRowDescriptorTypeSelectorPush title:@"Level"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"F - Nivel de vuelo"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"S - Nivel metrico"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"A - Altitud centenares de pies"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"M - Altitud decenas de metros"]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"F - Nivel de vuelo"];
    [section addFormRow:row];

    
    // SECTION 4
    section = [XLFormSectionDescriptor formSectionWithTitle:nil];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyorigin rowType:XLFormRowDescriptorTypeEmail title:@"Origin"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlydestination rowType:XLFormRowDescriptorTypeEmail title:@"Destination"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [section addFormRow:row];
    
    // SECTION 5 - Alternative fly
    section = [XLFormSectionDescriptor formSectionWithTitle:@"Alternatives"
                                             sectionOptions:XLFormSectionOptionCanReorder | XLFormSectionOptionCanInsert | XLFormSectionOptionCanDelete
                                          sectionInsertMode:XLFormSectionInsertModeButton];
    section.multivaluedAddButton.title = @"Add Fly Alternative";
    [section.multivaluedAddButton.cellConfig setObject:AppColor forKey:@"textLabel.color"];

    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyalternative rowType:XLFormRowDescriptorTypeName];
    [[row cellConfig] setObject:@"..." forKey:@"textField.placeholder"];
    section.multivaluedRowTemplate = row;
    [form addFormSection:section];
    
    
    // SECTION 6
    section = [XLFormSectionDescriptor formSectionWithTitle:nil];
    [form addFormSection:section];
    
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyEET rowType:XLFormRowDescriptorTypeEmail title:@"Total EET"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [section addFormRow:row];
    
    
    // SECTION 7
    section = [XLFormSectionDescriptor formSectionWithTitle:@"More util information."];
    [form addFormSection:section];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyinformation rowType:XLFormRowDescriptorTypeTextView title:@"Notes"];
    row.required = NO;
    [section addFormRow:row];
    
    
    // SECTION BUTTON
    section = [XLFormSectionDescriptor formSectionWithTitle:nil];
    [form addFormSection:section];
    
    XLFormRowDescriptor * buttonRow = [XLFormRowDescriptor formRowDescriptorWithTag:KButtonCreateFPL rowType:XLFormRowDescriptorTypeButton title:@"Create FPL"];
    buttonRow.action.formSelector = @selector(CreateFPL:);
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
        }
        else{
            [startDateDescriptor.cellConfig removeObjectForKey:@"detailTextLabel.attributedText"];
            [self updateFormRow:startDateDescriptor];
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
    
    NSArray * array = [self formValidationErrors];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        XLFormValidationStatus * validationStatus = [[obj userInfo] objectForKey:XLValidationStatusErrorKey];
        if ([validationStatus.rowDescriptor.tag isEqualToString:ModelFlynumber]){
            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
            [self animateCell:cell];
        }
        else if ([validationStatus.rowDescriptor.tag isEqualToString:ModelFlyenrollment]){
            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
            [self animateCell:cell];
        }else if ([validationStatus.rowDescriptor.tag isEqualToString:ModelFlycompany]){
            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
            [self animateCell:cell];
        }else if ([validationStatus.rowDescriptor.tag isEqualToString:ModelFlyaeroplaneNumber]){
            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
            [self animateCell:cell];
        }else if ([validationStatus.rowDescriptor.tag isEqualToString:ModelFlyaeroplaneType]){
            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
            [self animateCell:cell];
        }else if ([validationStatus.rowDescriptor.tag isEqualToString:ModelFlyequipment]){
            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
            [self animateCell:cell];
        }else if ([validationStatus.rowDescriptor.tag isEqualToString:ModelFlyaerodrome]){
            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
            [self animateCell:cell];
        }else if ([validationStatus.rowDescriptor.tag isEqualToString:ModelFlyspeed]){
            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
            [self animateCell:cell];
        }else if ([validationStatus.rowDescriptor.tag isEqualToString:ModelFlyorigin]){
            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
            [self animateCell:cell];
        }else if ([validationStatus.rowDescriptor.tag isEqualToString:ModelFlydestination]){
            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
            [self animateCell:cell];
        }else if ([validationStatus.rowDescriptor.tag isEqualToString:ModelFlyEET]){
            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
            [self animateCell:cell];
        }
    }];
    if([array count] == 0){
        NSMutableDictionary *temp = [[NSMutableDictionary alloc] init];
        [temp setValue:@"P" forKey:ModelFlystate];
        
        NSMutableArray *arrAlternatives = [[NSMutableArray alloc] init];

        for(int i = 0; i < [[self.form formSections] count] ; i++){
            for (XLFormRowDescriptor *row in [[[self.form formSections] objectAtIndex:i] formRows]) {
                if([row.rowType isEqualToString:XLFormRowDescriptorTypeSelectorPush]){
                    [temp setValue:[row.value displayText] forKey:row.tag];
                }else if([row.rowType isEqualToString:XLFormRowDescriptorTypeDateInline]){
                    // convertir fecha a string o enviar en formato fecha
                    
                }else if([row.rowType isEqualToString:XLFormRowDescriptorTypeName]){
                    if (row.value != nil) {
                        [arrAlternatives addObject:row.value];
                        [temp setValue:arrAlternatives forKey:ModelFlyalternative];
                        
                    }
                }else{
                    if (row.value != nil) {
                        [temp setValue:row.value forKey:row.tag];
                    }
                }
            }
        }
        Fly *newFly = [[Fly alloc] initWithDict:temp];
        
        [ShowAlert ShowAlertWithTitle:@"Submit Successfull" andMessage:@"Your FPL was created successfully" acceptBlock:^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ReloadPendingFPL" object:newFly];

            [self.navigationController popViewControllerAnimated:YES];
        }];
    }else{
        [RKDropdownAlert title:@"Submit failure" message:@"Complete all requiered fields and try again." backgroundColor:AlertColorError textColor:[UIColor whiteColor] time:2];
    }

    [self deselectFormRow:sender];
}

-(void)animateCell:(UITableViewCell *)cell{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values =  @[ @0, @20, @-20, @10, @0];
    animation.keyTimes = @[@0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1];
    animation.duration = 0.3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.additive = YES;
    
    [cell.layer addAnimation:animation forKey:@"shake"];
}

@end
