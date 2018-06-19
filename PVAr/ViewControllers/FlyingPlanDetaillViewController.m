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

NSString *const KNumberDetail = @"KNumber";
NSString *const KPriorityDetail = @"KPriority";
NSString *const KEnrollmentDetail = @"KEnrollment";
NSString *const KCompanyDetail = @"KCompany";
NSString *const KruleDetail = @"Krule";
NSString *const KTypeDetail = @"KType";

NSString *const KAeroplaneNumberDetail = @"KAeroplaneNumber";
NSString *const KAeroplaneTypeDetail = @"KAeroplaneType";
NSString *const KCategoryDetail = @"KCategory";
NSString *const KEquipmentDetail = @"KEquipment";

NSString *const KAerodromeDetail = @"KAerodrome";
NSString *const KDateTimeDetail = @"KDateTime";
NSString *const KUnitDetail = @"KUnit";
NSString *const KSpeedDetail = @"KSpeed";
NSString *const KLevelDetail = @"KLevel";

NSString *const KOriginDetail = @"KOrigin";
NSString *const KDestinationDetail = @"KDestination";
NSString *const KAlternativeDetail = @"KAlternative";
NSString *const KTotalEETDetail = @"KTotalEET";

NSString *const KMoreInfoDetail = @"KMoreInfo";

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
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KNumberDetail rowType:XLFormRowDescriptorTypeEmail title:@"Number"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.number;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KPriorityDetail rowType:XLFormRowDescriptorTypeSelectorPush title:@"Priority"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.priority]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.priority];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KEnrollmentDetail rowType:XLFormRowDescriptorTypeEmail title:@"Enrollment"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.enrollment;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KCompanyDetail rowType:XLFormRowDescriptorTypeEmail title:@"Company"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.company;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KruleDetail rowType:XLFormRowDescriptorTypeSelectorPush title:@"Rule"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.rule]];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.rule];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KTypeDetail rowType:XLFormRowDescriptorTypeSelectorPush title:@"Type"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.type]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.type];
    [section addFormRow:row];
    
    
    // SECTION 2
    section = [XLFormSectionDescriptor formSectionWithTitle:@"AEROPLANE INFORMATION"];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KAeroplaneNumberDetail rowType:XLFormRowDescriptorTypeEmail title:@"Number"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.aeroplaneNumber;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KAeroplaneTypeDetail rowType:XLFormRowDescriptorTypeEmail title:@"Type"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.aeroplaneType;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KCategoryDetail rowType:XLFormRowDescriptorTypeSelectorPush title:@"Category"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.category]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.category];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KEquipmentDetail rowType:XLFormRowDescriptorTypeEmail title:@"Equipment"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.equipment;
    [section addFormRow:row];
    
    
    // SECTION 3
    section = [XLFormSectionDescriptor formSectionWithTitle:nil];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KAerodromeDetail rowType:XLFormRowDescriptorTypeEmail title:@"Aerodrome"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.aerodrome;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KDateTimeDetail rowType:XLFormRowDescriptorTypeDateTimeInline title:@"Date Time"];
    row.value = [NSDate new];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KUnitDetail rowType:XLFormRowDescriptorTypeSelectorPush title:@"Units"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.unit]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.unit];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KSpeedDetail rowType:XLFormRowDescriptorTypeEmail title:@"Speed"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.speed;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KLevelDetail rowType:XLFormRowDescriptorTypeSelectorPush title:@"Level"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.level]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:self.fly.level];
    [section addFormRow:row];
    
    // SECTION 4
    section = [XLFormSectionDescriptor formSectionWithTitle:nil];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KOriginDetail rowType:XLFormRowDescriptorTypeEmail title:@"Origin"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.origin;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KDestinationDetail rowType:XLFormRowDescriptorTypeEmail title:@"Destination"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.destination;
    [section addFormRow:row];


    if([self.fly.alternative count] > 0){
        // SECTION 5 - Alternative fly
        section = [XLFormSectionDescriptor formSectionWithTitle:@"Alternatives"];
        
        for (int i = 0; i<[self.fly.alternative count]; i++) {
            
            row = [XLFormRowDescriptor formRowDescriptorWithTag:[NSString stringWithFormat:@"%@%d",KAlternativeDetail,i] rowType:XLFormRowDescriptorTypeText];
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
    
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KTotalEETDetail rowType:XLFormRowDescriptorTypeEmail title:@"Total EET"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = self.fly.EET;
    [section addFormRow:row];
    
    
    // SECTION 7
    section = [XLFormSectionDescriptor formSectionWithTitle:@"More util information."];
    [form addFormSection:section];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:KMoreInfoDetail rowType:XLFormRowDescriptorTypeTextView title:@"Notes"];
    row.value = self.fly.information;
    [section addFormRow:row];
    
    form.disabled = @YES;
    self.form = form;
    
}
@end
