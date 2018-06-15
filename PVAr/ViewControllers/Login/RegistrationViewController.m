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
    if([form validateUserForm] == true){
        [ShowAlert ShowAlertWithTitle:@"Registration Successfull" andMessage:@"Your account was created successfully, please back to login." acceptBlock:^{
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }else{
        [RKDropdownAlert title:@"Registration failure" message:@"Please complete all fields and try again." backgroundColor:AlertColorError textColor:[UIColor whiteColor] time:2];
    }
}
@end
