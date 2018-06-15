//
//  UIViewController+CreateFlyingPlanViewController.m
//  PVAr
//
//  Created by Prisma on 14/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "CreateFlyingPlanViewController.h"
#import "FlyForm.h"
#import "Constants.h"
#import "ShowAlert.h"

@interface CreateFlyingPlanViewController(){
    FlyForm *form;
}
@end

@implementation CreateFlyingPlanViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.formController.form = [[FlyForm alloc] init];

}

- (void)submitFlyingForm:(UITableViewCell<FXFormFieldCell> *)cell{
    //we can lookup the form from the cell if we want, like this:
    form = cell.field.form;

    if([form validateFlyForm] == true){
        [ShowAlert ShowAlertWithTitle:@"Submit Successfull" andMessage:@"Your flying plan was created." acceptBlock:^{
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }else{
        [RKDropdownAlert title:@"Submit failure" message:@"Please complete all fields and try again." backgroundColor:AlertColorError textColor:[UIColor whiteColor] time:2];
    }
}

@end
