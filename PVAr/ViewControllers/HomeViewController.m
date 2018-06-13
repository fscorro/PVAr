//
//  UIViewController+HomeViewController.m
//  PVAr
//
//  Created by Prisma on 12/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "HomeViewController.h"
#import "ShowAlert.h"

@implementation HomeViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
}

- (IBAction)Logout:(id)sender {
    [ShowAlert ShowAlertWithTitle:@"Logout" andMessage:@"Are you sure you want to quit?" acceptBlock:^{
        [self.navigationController popViewControllerAnimated:YES];
    } cancelBlock:^{
        NSLog(@"Logout Cancelled");
    }];
}
@end
