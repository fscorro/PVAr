//
//  UIViewController+FlyingPlanDetaillViewController.h
//  PVAr
//
//  Created by Prisma on 14/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XLForm.h>
#import <XLFormViewController.h>
#import "Fly.h"

@interface FlyingPlanDetaillViewController : XLFormViewController

@property (strong, nonatomic) Fly *fly;

@end
