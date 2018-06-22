//
//  UIViewController+FlyingPlanDetaillViewController.m
//  PVAr
//
//  Created by Prisma on 14/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "FlyingPlanDetaillViewController.h"
#import "Constants.h"
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
    
    section = [XLFormSectionDescriptor formSectionWithTitle:@"FLY INFORMATION"];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlynumber rowType:XLFormRowDescriptorTypeEmail title:@"Fly Number"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.number;
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlypriority rowType:XLFormRowDescriptorTypeSelectorPush title:@"Priority"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.priority]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.priority];
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyenrollment rowType:XLFormRowDescriptorTypeEmail title:@"Enrollment"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.enrollment;
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlycompany rowType:XLFormRowDescriptorTypeEmail title:@"Company"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.company;
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
    section = [XLFormSectionDescriptor formSectionWithTitle:@"AEROPLANE INFORMATION"];
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
    section = [XLFormSectionDescriptor formSectionWithTitle:nil];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyaerodrome rowType:XLFormRowDescriptorTypeEmail title:@"Aerodrome"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.aerodrome;
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlydateTime rowType:XLFormRowDescriptorTypeDateTimeInline title:@"Date Time"];
    row.value = [NSDate new];
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyunit rowType:XLFormRowDescriptorTypeSelectorPush title:@"Units"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.unit]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.unit];
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyspeed rowType:XLFormRowDescriptorTypeEmail title:@"Speed"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.speed;
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlylevel rowType:XLFormRowDescriptorTypeSelectorPush title:@"Level"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.level]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.level];
    row.disabled = @YES;
    [section addFormRow:row];
    
    // SECTION 4
    section = [XLFormSectionDescriptor formSectionWithTitle:nil];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlyorigin rowType:XLFormRowDescriptorTypeEmail title:@"Origin"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.origin;
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:ModelFlydestination rowType:XLFormRowDescriptorTypeEmail title:@"Destination"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.destination;
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
