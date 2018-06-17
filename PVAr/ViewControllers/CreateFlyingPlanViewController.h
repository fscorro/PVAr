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

@interface CreateFlyingPlanViewController : XLFormViewController

@property (weak, nonatomic) IBOutlet UITableView *tableViewCreateFly;

@end
