//
//  UIViewController+FlyingPlanDetaillViewController.h
//  PVAr
//
//  Created by Prisma on 14/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RKDropdownAlert.h>
#import "Fly.h"

@interface FlyingPlanDetaillViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *FlyDetailTableview;

@property (strong, nonatomic) Fly *fly;

@end
