//
//  UIViewController+CreateFlyingPlanViewController.h
//  PVAr
//
//  Created by Prisma on 14/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RKDropdownAlert.h>
#import <XLForm.h>
#import <XLFormViewController.h>
#import "Fly.h"
#import "CreateSupplementaryInformation.h"
#import "CustomSelectorViewController.h"

@interface CreateFlyingPlanViewController : XLFormViewController <CreateSupplementaryInformationDelegate, CustomSelectorDelegate>


@end
