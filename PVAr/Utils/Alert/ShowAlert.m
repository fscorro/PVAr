//
//  UIViewController+ShowAlert.m
//  BanelcoMovil
//
//  Created by Prisma on 1/3/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "ShowAlert.h"
#import "Constants.h"
#import <TYAlertController/TYAlertController.h>
#import <TYAlertController/TYAlertView.h>
#import <TYAlertController/TYShowAlertView.h>

@implementation ShowAlert

+(id)sharedShowAlert{
    static ShowAlert *showAlert;
    @synchronized(self) {
        if (!showAlert)
            showAlert = [[self alloc] init];
    }
    return showAlert;
}

+(void)ShowAlertWithTitle:(NSString *)title andMessage:(NSString *)message acceptBlock:(AcceptBlock)accept cancelBlock:(CancelBlock)cancel{
    
    TYAlertView *alertView = [TYAlertView alertViewWithTitle:title message:message];
    
    [alertView setButtonDefaultBgColor:AppColor];
    [alertView addAction:[TYAlertAction actionWithTitle:@"Accept" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        accept();
    }]];

    [alertView setButtonCancelBgColor:AppColor];
    [alertView addAction:[TYAlertAction actionWithTitle:@"Cancel" style:TYAlertActionStyleCancel handler:^(TYAlertAction *action) {
        cancel();
    }]];
    
    // first way to show ,use UIView Category
    [TYShowAlertView showAlertViewWithView:alertView originY:200 backgoundTapDismissEnable:YES];
}

+(void)ShowAlertWithTitle:(NSString *)title andMessage:(NSString *)message acceptBlock:(AcceptBlock)accept{
    
    TYAlertView *alertView = [TYAlertView alertViewWithTitle:title message:message];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"Accept" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        accept();
    }]];
    [alertView setButtonDefaultBgColor:AppColor];

    // first way to show ,use UIView Category
    [TYShowAlertView showAlertViewWithView:alertView originY:200 backgoundTapDismissEnable:YES];
}

+(void) ShowAlertRestorePinWithTitle:(NSString*)title acceptBlock:(AcceptBlock)accept cancelBlock:(CancelBlock)cancel{
    
    TYAlertView *alertView = [TYAlertView alertViewWithTitle:title message:@"Enter your email"];
    
    [alertView setButtonDefaultBgColor:AppColor];
    [alertView addAction:[TYAlertAction actionWithTitle:@"Accept" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        accept();
    }]];
    
    [alertView setButtonCancelBgColor:AlertColorError];
    [alertView addAction:[TYAlertAction actionWithTitle:@"Cancel" style:TYAlertActionStyleCancel handler:^(TYAlertAction *action) {
        cancel();
    }]];
    
    [alertView addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Email";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeEmailAddress;
        textField.returnKeyType = UIReturnKeyNext;
        textField.enablesReturnKeyAutomatically = YES;
        textField.secureTextEntry = YES;
        textField.delegate = [self sharedShowAlert];
    }];
    
    // first way to show ,use UIView Category
    [TYShowAlertView showAlertViewWithView:alertView originY:200 backgoundTapDismissEnable:YES];
}

+(void) ShowAlertRestorePasswordWithTitle:(NSString*)title acceptBlock:(AcceptBlockWithParamethers)accept cancelBlock:(CancelBlock)cancel{
    
    TYAlertView *alertView = [TYAlertView alertViewWithTitle:title message:@"Enter new password."];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    [alertView setButtonDefaultBgColor:AppColor];
    [alertView addAction:[TYAlertAction actionWithTitle:@"Accept" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        accept(dic);
    }]];
    
    [alertView setButtonCancelBgColor:AppColor];
    [alertView addAction:[TYAlertAction actionWithTitle:@"Cancel" style:TYAlertActionStyleCancel handler:^(TYAlertAction *action) {
        cancel();
    }]];
    
    [alertView addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Password";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyNext;
        textField.enablesReturnKeyAutomatically = YES;
        textField.secureTextEntry = YES;
        textField.tag = 100;
        textField.delegate = [self sharedShowAlert];
        
        [dic setValue:textField.text forKey:@"Password"];
    }];
    
    [alertView addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Confirm Password";
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyNext;
        textField.enablesReturnKeyAutomatically = YES;
        textField.secureTextEntry = YES;
        textField.tag = 101;
        textField.delegate = [self sharedShowAlert];
        
        [dic setValue:textField.text forKey:@"Confirm Password"];
    }];
    
    // first way to show ,use UIView Category
    [TYShowAlertView showAlertViewWithView:alertView originY:200 backgoundTapDismissEnable:YES];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField.tag == 100){
        return false;
    }else{
        [textField resignFirstResponder];
        return true;
    }
    return false;
}
@end
