//
//  UIViewController+LoginViewController.m
//  PVAr
//
//  Created by Prisma on 12/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "LoginViewController.h"
#import "Constants.h"

typedef NS_ENUM(NSInteger, LoginState) {
    loginSuccess = 0,
    loginError,
    loginEmpty,
    loginInvalidPassword,
    loginInvalidMail
};

@interface LoginViewController(){
    
}
@end

@implementation LoginViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self
    action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleFingerTap];
    
    [self navigateTextfields];
    
    self.loginButton.layer.cornerRadius = 10.0f;
    self.loginButton.clipsToBounds = true;
    
    [self.imageTextfieldUser setImage:[self changeImagen:[UIImage imageNamed:@"icon_user"]]];
    [self.imageTextfieldUser setTintColor:AppColorLight];

    [self.imageTextfieldPassword setImage:[self changeImagen:[UIImage imageNamed:@"icon_password"]]];
    [self.imageTextfieldPassword setTintColor:AppColorLight];
    
    self.viewTextfieldUser.layer.cornerRadius = 5.0f;
    self.viewTextfieldUser.layer.borderWidth = 1.0f;
    self.viewTextfieldUser.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    
    self.viewTextfieldPassword.layer.cornerRadius = 5.0f;
    self.viewTextfieldPassword.layer.borderWidth = 1.0f;
    self.viewTextfieldPassword.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;

    // Textfield Button Show Password
    UIButton *hideShow = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45, self.textfieldPassword.frame.size.height)];
    [hideShow setImage:[self changeImagen:[UIImage imageNamed:@"password_show"]] forState:UIControlStateNormal];
    [hideShow.imageView setTintColor:[UIColor lightGrayColor]];

    self.textfieldPassword.rightView = hideShow;
    self.textfieldPassword.rightViewMode = UITextFieldViewModeAlways;
    [hideShow addTarget:self action:@selector(hideShow:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.textfieldUser setText:nil];
    [self.textfieldPassword setText:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.textfieldPassword setSecureTextEntry:true];
}

- (void)handleSingleTap:(UITapGestureRecognizer*)sender {
    [self dismissTextfield];
}

-(void) dismissTextfield{
    if([self.textfieldUser isFirstResponder]){
        [self.textfieldUser resignFirstResponder];
    }else if ([self.textfieldPassword isFirstResponder]){
        [self.textfieldPassword resignFirstResponder];
    }
}

- (void)hideShow:(id)sender{
    UIButton *hideShow = (UIButton *)self.textfieldPassword.rightView;
    if (!self.textfieldPassword.secureTextEntry){
        self.textfieldPassword.secureTextEntry = YES;
        [hideShow setImage:[self changeImagen:[UIImage imageNamed:@"password_show"]] forState:UIControlStateNormal];
    }
    else{
        self.textfieldPassword.secureTextEntry = NO;
        [hideShow setImage:[self changeImagen:[UIImage imageNamed:@"password_hide"]] forState:UIControlStateNormal];
    }
    [self.textfieldPassword becomeFirstResponder];
}

-(UIImage*)changeImagen:(UIImage*)image{
    UIImage *btnImage = image;
    btnImage = [btnImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return btnImage;
}

-(void)navigateTextfields{
    [self.textfieldUser addTarget:self.textfieldPassword action:@selector(becomeFirstResponder) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.textfieldPassword addTarget:self action:@selector(resignFirstResponder) forControlEvents:UIControlEventEditingDidEndOnExit];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if([textField isEqual:self.textfieldPassword]){
        [self animateTextField:textField up:YES];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if([textField isEqual:self.textfieldPassword]){
        [self animateTextField:textField up:NO];
    }
}

-(void)animateTextField:(UITextField*)textField up:(BOOL)up{
    const int movementDistance = -(self.view.frame.size.height / 3);// - self.viewTextfields.frame.size.height / 2);
    const float movementDuration = 0.2f;
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

-(NSInteger)validateLogin{
    if([self.textfieldUser.text isEqualToString:@"admin@gmail.com"] && [self.textfieldPassword.text isEqualToString:@"admin123"]){
        return loginSuccess;
    } else if([self.textfieldUser.text length] <= 0 || [self.textfieldPassword.text length] <= 0){
        return loginEmpty;
    } else if([self.textfieldUser.text length] <= 0 || ![self.textfieldUser.text isEqualToString:@"admin@gmail.com"]){
        return loginInvalidMail;
    } else if([self.textfieldPassword.text length] <= 0 || ![self.textfieldPassword.text isEqualToString:@"admin123"]){
        return loginInvalidPassword;
    }
    return loginError;
}

- (IBAction)ForgotPassword:(id)sender {
}

- (IBAction)Login:(id)sender {
    [self dismissTextfield];
    
//    [self.textfieldUser setText:@"admin@gmail.com"];
//    [self.textfieldPassword setText:@"admin123"];
    
    switch ([self validateLogin]) {
        case loginSuccess:
            [self performSegueWithIdentifier:@"SegueHome" sender:nil];
            break;
        case loginError:
            [RKDropdownAlert title:@"Login failure" message:@"Please verify the entered values." backgroundColor:AlertColorError textColor:[UIColor whiteColor] time:2];
            break;
        case loginEmpty:
            [RKDropdownAlert title:@"Login failure" message:@"Please complete all fields and try again.." backgroundColor:AlertColorError textColor:[UIColor whiteColor] time:2];
            break;
        case loginInvalidPassword:
            [RKDropdownAlert title:@"Login failure" message:@"Please verify the entered password." backgroundColor:AlertColorError textColor:[UIColor whiteColor] time:2];
            break;
        case loginInvalidMail:
            [RKDropdownAlert title:@"Login failure" message:@"Please verify the entered email." backgroundColor:AlertColorError textColor:[UIColor whiteColor] time:2];
            break;
    }
}
@end
