//
//  UIViewController+FlyingPlanDetaillViewController.m
//  PVAr
//
//  Created by Prisma on 14/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "FlyingPlanDetaillViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "Fly.h"
#import "DetailSupplementaryInformation.h"

@interface FlyingPlanDetaillViewController(){
    
}
@end


@implementation FlyingPlanDetaillViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self initializeForm];
}

-(void)initializeForm{
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [XLFormDescriptor formDescriptor];
    
    // SECTION 1
    section = [XLFormSectionDescriptor formSectionWithTitle:@"AIRCRAFT INFORMATION"];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyaeroplaneID rowType:XLFormRowDescriptorTypeZipCode title:@"Identifier"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.aeroplaneID;
    row.disabled = @YES;
    [section addFormRow:row];

    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyrule rowType:XLFormRowDescriptorTypeSelectorPush title:@"Rule"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.rule]];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.rule];
    row.disabled = @YES;
    [section addFormRow:row];

    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlytype rowType:XLFormRowDescriptorTypeSelectorPush title:@"Type"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.type]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.type];
    row.disabled = @YES;
    [section addFormRow:row];
    
    
    // SECTION 2
    section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyaeroplaneNumber rowType:XLFormRowDescriptorTypeEmail title:@"Number"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.aeroplaneNumber;
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyaeroplaneType rowType:XLFormRowDescriptorTypeEmail title:@"Type"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.aeroplaneType;
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlycategory rowType:XLFormRowDescriptorTypeSelectorPush title:@"Category"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.category]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.category];
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyequipment rowType:XLFormRowDescriptorTypeEmail title:@"Equipment"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.equipment;
    row.disabled = @YES;
    [section addFormRow:row];
    
    
    // SECTION 3
    section = [XLFormSectionDescriptor formSectionWithTitle:@"FLY INFORMATION"];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyoriginAerodrome rowType:XLFormRowDescriptorTypeText title:@"Origin aerodrome"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.originAerodrome;
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlydestinationAerodrome rowType:XLFormRowDescriptorTypeText title:@"Destination aerodrome"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.destinationAerodrome;
    row.disabled = @YES;
    [section addFormRow:row];
    
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlydateTime rowType:XLFormRowDescriptorTypeDateTimeInline title:@"Date Time"];
    row.value = self.fly.dateTime;
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyspeed rowType:XLFormRowDescriptorTypeText title:@"Cruissing speed"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:[[Utils sharedUtils] leftViewForTextfieldWithLabelText:[self.fly.speed substringToIndex:1] isEnabled:false] forKey:@"textField.leftView"];
    [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.leftViewMode"];
    row.value = [self.fly.speed substringWithRange:NSMakeRange(1, [self.fly.speed length]-1)];
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlylevel rowType:XLFormRowDescriptorTypeText title:@"Level"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    NSString *strObject;
    if([self.fly.level containsString:@"VFR"]){
        strObject = [self.fly.level substringToIndex:3];
    }else{
        strObject = [self.fly.level substringToIndex:1];
    }
    [row.cellConfig setObject:[[Utils sharedUtils] leftViewForTextfieldWithLabelText:strObject isEnabled:false] forKey:@"textField.leftView"];
    [row.cellConfig setObject:@(UITextFieldViewModeAlways) forKey:@"textField.leftViewMode"];
    if([self.fly.level containsString:@"VFR"]){
        row.value = [self.fly.level substringWithRange:NSMakeRange(3, [self.fly.level length]-3)];;
    }else{
        row.value = [self.fly.level substringWithRange:NSMakeRange(1, [self.fly.speed length]-1)];
    }
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyroute rowType:XLFormRowDescriptorTypeTextView title:@"Route"];
    row.value = self.fly.route;
    row.disabled = @YES;
    [section addFormRow:row];
    

    if([self.fly.alternative count] > 0){
        // SECTION 5 - Alternative fly
        section = [XLFormSectionDescriptor formSectionWithTitle:@"Alternatives"];
        
        for (int i = 0; i<[self.fly.alternative count]; i++) {
            
            row = [XLFormRowDescriptor formRowDescriptorWithTag:[NSString stringWithFormat:@"%@%d",ModelFlyalternative,i] rowType:XLFormRowDescriptorTypeText];
            row.disabled = @YES;
            row.value = [self.fly.alternative objectAtIndex:i];
            [section addFormRow:row];
        }
        section.footerTitle = [NSString stringWithFormat:@"Number of alternatives destinations: %lu",(unsigned long)[self.fly.alternative count]];
        
        [form addFormSection:section];
    }else{
        section.footerTitle = @"No alternatives destinations";
    }
    
    
    // SECTION 6
    section = [XLFormSectionDescriptor formSectionWithTitle:nil];
    [form addFormSection:section];
    
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyEET rowType:XLFormRowDescriptorTypeEmail title:@"Total EET"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.EET;
    row.disabled = @YES;
    [section addFormRow:row];
    
    
    // SECTION 7
    section = [XLFormSectionDescriptor formSectionWithTitle:@"More util information."];
    [form addFormSection:section];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyinformation rowType:XLFormRowDescriptorTypeTextView title:@"Notes"];
    row.value = self.fly.information;
    row.disabled = @YES;
    [section addFormRow:row];
    
    
    // SECTION SUPPLEMENTARY INFORMATION
    section = [XLFormSectionDescriptor formSectionWithTitle:nil];
    XLFormRowDescriptor * buttonWithSegueId = [XLFormRowDescriptor formRowDescriptorWithTag:@"SuplementaryInfo" rowType:XLFormRowDescriptorTypeButton title:@"Supplementary Information"];
    buttonWithSegueId.action.formSegueIdentifier = @"SegueSupplementaryInformation";
    [section addFormRow:buttonWithSegueId];
    [form addFormSection:section];
    
    
    //form.disabled = @YES;
    self.form = form;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *segueId = segue.identifier;
    
    if ([segueId isEqualToString:@"SegueSupplementaryInformation"]) {
        DetailSupplementaryInformation *vc = segue.destinationViewController;
        vc.fly = self.fly;
    }
}
@end
