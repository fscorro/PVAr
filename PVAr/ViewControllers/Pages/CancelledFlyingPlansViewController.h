//
//  UIViewController+CancelledFlyingPlansViewController.h
//  PVAr
//
//  Created by Prisma on 13/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CancelledFlyingPlansViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableviewCancelledFlying;
@property (strong, nonatomic) IBOutlet UIView *viewEmptyMessage;

@end
