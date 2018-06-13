//
//  UIViewController+RegistrationViewController.m
//  PVAr
//
//  Created by Prisma on 12/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "RegistrationViewController.h"
#import "UserForm.h"
#import "Constants.h"
#import "ShowAlert.h"

@interface RegistrationViewController(){
    UserForm *form;
}
@end

@implementation RegistrationViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.formController.form = [[UserForm alloc] init];
}

- (void)submitRegistrationForm:(UITableViewCell<FXFormFieldCell> *)cell{
    //we can lookup the form from the cell if we want, like this:
    form = cell.field.form;
    if([self validateForm] == true){
        [ShowAlert ShowAlertWithTitle:@"Registration Successfull" andMessage:@"Your account was created successfully, please back to login." acceptBlock:^{
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }
}

-(BOOL)validateForm{
    if([form.email length] <= 0 || [form.password length] <= 0 || [form.repeatPassword length] <= 0){
        [RKDropdownAlert title:@"Registration failure" message:@"Please complete all fields and try again." backgroundColor:AlertColorError textColor:[UIColor whiteColor] time:2];
        return false;
    }else if(![form.password isEqualToString:form.repeatPassword]){
        [RKDropdownAlert title:@"Registration failure" message:@"Please verify your password." backgroundColor:AlertColorError textColor:[UIColor whiteColor] time:2];
        return false;
    }
    return true;
}
@end
