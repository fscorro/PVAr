//
//  UIViewController+LoginViewController.h
//  PVAr
//
//  Created by Prisma on 12/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RKDropdownAlert.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *viewTextfieldUser;
@property (weak, nonatomic) IBOutlet UIImageView *imageTextfieldUser;
@property (weak, nonatomic) IBOutlet UITextField *textfieldUser;

@property (weak, nonatomic) IBOutlet UIView *viewTextfieldPassword;
@property (weak, nonatomic) IBOutlet UIImageView *imageTextfieldPassword;
@property (weak, nonatomic) IBOutlet UITextField *textfieldPassword;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

- (IBAction)ForgotPassword:(id)sender;
- (IBAction)Login:(id)sender;

@end
