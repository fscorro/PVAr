//
//  UIViewController+Utils.m
//  PVAr
//
//  Created by Roberto Daviduk on 24/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "Utils.h"
#import "Constants.h"

@implementation Utils

+(id)sharedUtils{
    static Utils *utils;
    @synchronized(self) {
        if (!utils)
            utils = [[self alloc] init];
    }
    return utils;
}

- (CALayer*)addTopBorderToView:(UIView*)view {
    CALayer *border = [CALayer layer];
    border.backgroundColor = [UIColor groupTableViewBackgroundColor].CGColor;
    
    border.frame = CGRectMake(0, 0, view.frame.size.width, 2);
    return border;
}

- (CALayer*)addBottomBorderToView:(UIView*)view{
    CALayer *border = [CALayer layer];
    border.backgroundColor = [UIColor groupTableViewBackgroundColor].CGColor;
    
    border.frame = CGRectMake(0, view.frame.size.height - 2, view.frame.size.width, 2);
    return border;
}

- (CALayer*)addLeftBorderToView:(UIView*)view {
    CALayer *border = [CALayer layer];
    border.backgroundColor = [UIColor groupTableViewBackgroundColor].CGColor;
    
    border.frame = CGRectMake(0, 0, 2, view.frame.size.height);
    return border;
}

- (CALayer*)addRightBorderToView:(UIView*)view {
    CALayer *border = [CALayer layer];
    border.backgroundColor = [UIColor groupTableViewBackgroundColor].CGColor;
    
    border.frame = CGRectMake(view.frame.size.width - 2, 0, 2, view.frame.size.height);
    return border;
}

- (UIView*)leftViewForTextfieldWithLabelText:(NSString*)text isEnabled:(BOOL)enabled{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [view setBackgroundColor:[UIColor clearColor]];
    
    UIFont * customFont = [UIFont boldSystemFontOfSize:14.0f];
    
    UILabel *fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    fromLabel.text = text;
    fromLabel.font = customFont;
    fromLabel.numberOfLines = 1;
    fromLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    fromLabel.adjustsFontSizeToFitWidth = YES;
    fromLabel.clipsToBounds = YES;
    fromLabel.backgroundColor = [UIColor clearColor];
    fromLabel.textColor = enabled ? [UIColor blackColor] : [UIColor lightGrayColor];
    fromLabel.textAlignment = NSTextAlignmentCenter;
    
    [view addSubview:fromLabel];
    
    [view.layer addSublayer:[self addLeftBorderToView:view]];
    [view.layer addSublayer:[self addRightBorderToView:view]];
    
    return view;
}

-(NSString *) dateFormnat:(NSDate*)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:DateFormat];
    NSString *strDate = [formatter stringFromDate:date];
    return strDate;
}

-(NSString *) timeFormnat:(NSDate*)time{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:TimeFormat];
    NSString *strTime = [formatter stringFromDate:time];
    return strTime;
}

@end
