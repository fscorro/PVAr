//
//  UITableViewCell+CreateSimplifiedFPLViewController.h
//  PVAr
//
//  Created by Roberto Daviduk on 20/7/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RKDropdownAlert.h>
#import <XLForm.h>
#import <XLFormViewController.h>
#import "Fly.h"
#import "SuppInfoSimplifiedFPLViewController.h"
#import "CustomSelectorViewController.h"

@interface CreateSimplifiedFPLViewController : XLFormViewController <SuppInfoSimplifiedFPLViewControllerDelegate, CustomSelectorDelegate>

@end
