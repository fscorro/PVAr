//
//  UIViewController+DetailSupplementaryInformation.h
//  PVAr
//
//  Created by Roberto Daviduk on 20/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XLForm.h>
#import <XLFormViewController.h>
#import "Fly.h"

@interface DetailSupplementaryInformation : XLFormViewController

@property (strong, nonatomic) Fly *fly;

@end
