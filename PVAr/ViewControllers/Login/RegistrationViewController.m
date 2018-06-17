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
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kEmail rowType:XLFormRowDescriptorTypeText title:@"Email"];
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
    [section addFormRow:buttonRow];
    
    self.form = form;

}

-(void)didTouchButton:(XLFormRowDescriptor *)sender{
    NSArray * array = [self formValidationErrors];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        XLFormValidationStatus * validationStatus = [[obj userInfo] objectForKey:XLValidationStatusErrorKey];
        if ([validationStatus.rowDescriptor.tag isEqualToString:kEmail]){
            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
            [self animateCell:cell];
        }
        else if ([validationStatus.rowDescriptor.tag isEqualToString:kPassword]){
            UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
            [self animateCell:cell];
        }
    }];
    if([array count] == 0){
        [ShowAlert ShowAlertWithTitle:@"Registration Successfull" andMessage:@"Your user was created successfully" acceptBlock:^{
            [self.navigationController popViewControllerAnimated:YES];
        }];
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
