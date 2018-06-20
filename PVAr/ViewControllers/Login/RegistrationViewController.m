//
//  UIViewController+RegistrationViewController.m
//  PVAr
//
//  Created by Prisma on 12/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "RegistrationViewController.h"

#import "Constants.h"
#import "ShowAlert.h"

NSString *const kEmail = @"email";
NSString *const kPassword = @"password";
NSString *const kButton = @"button";


@interface RegistrationViewController(){

}
@end

@implementation RegistrationViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self initializeForm];
}

-(void)initializeForm{
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [XLFormDescriptor formDescriptor];
    
    section = [XLFormSectionDescriptor formSectionWithTitle:nil];
    section.footerTitle = @"between 6 and 32 charachers, 1 alphanumeric and 1 numeric";
    [form addFormSection:section];
    
    // Email
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kEmail rowType:XLFormRowDescriptorTypeEmail title:@"Email"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [row addValidator:[XLFormValidator emailValidator]];
    [section addFormRow:row];
    
    // Password
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kPassword rowType:XLFormRowDescriptorTypePassword title:@"Password"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:ValidationPlaceholderRequiered forKey:@"textField.placeholder"];
    row.required = YES;
    [row addValidator:[XLFormRegexValidator formRegexValidatorWithMsg:@"At least 6, max 32 characters" regex:@"^(?=.*\\d)(?=.*[A-Za-z]).{6,32}$"]];
    [section addFormRow:row];
    
    
    section = [XLFormSectionDescriptor formSectionWithTitle:nil];
    [form addFormSection:section];
    
    // Button
    XLFormRowDescriptor * buttonRow = [XLFormRowDescriptor formRowDescriptorWithTag:kButton rowType:XLFormRowDescriptorTypeButton title:@"Create user"];
    buttonRow.action.formSelector = @selector(didTouchButton:);
    [buttonRow.cellConfig setObject:AppColorLight forKey:@"textLabel.color"];
    [section addFormRow:buttonRow];
    
    self.form = form;

}

-(void)didTouchButton:(XLFormRowDescriptor *)sender{

    [self deselectFormRow:sender];

    NSArray * validationErrors = [self formValidationErrors];

    if (validationErrors.count > 0){
        for (id obj in validationErrors) {
            XLFormValidationStatus * validationStatus = [[obj userInfo] objectForKey:XLValidationStatusErrorKey];
            if ([validationStatus.rowDescriptor.tag isEqualToString:kEmail]){
                [RKDropdownAlert title:@"Registration failure" message:@"Invalid email address." backgroundColor:AlertColorError textColor:[UIColor whiteColor] time:3];
                return;
            } else if ([validationStatus.rowDescriptor.tag isEqualToString:kPassword]){
                [RKDropdownAlert title:@"Registration failure" message:@"Invalid password." backgroundColor:AlertColorError textColor:[UIColor whiteColor] time:3];
            }
        }
        return;
    }

    if([validationErrors count] == 0){
        [ShowAlert ShowAlertWithTitle:@"Registration Successfull" andMessage:@"Your user was created successfully" acceptBlock:^{
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }
}
@end
