//
//  UIViewController+Utils.h
//  PVAr
//
//  Created by Roberto Daviduk on 24/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Utils : UIViewController

+ (Utils *)sharedUtils;

- (CALayer*)addTopBorderToView:(UIView*)view;
- (CALayer*)addBottomBorderToView:(UIView*)view;
- (CALayer*)addLeftBorderToView:(UIView*)view;
- (CALayer*)addRightBorderToView:(UIView*)view;
- (UIView*)leftViewForTextfieldWithLabelText:(NSString*)text isEnabled:(BOOL)enabled;

-(NSString *) dateFormnat:(NSDate*)date;
-(NSString *) timeFormnat:(NSDate*)time;
-(NSString *) timeFormatPicker:(NSDate*)time;

@end
