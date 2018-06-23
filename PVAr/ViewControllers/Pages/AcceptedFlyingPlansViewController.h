//
//  UIViewController+AcceptedFlyingPlansViewController.h
//  PVAr
//
//  Created by Prisma on 13/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AcceptedFlyingPlansViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableviewAcceptedFlying;
@property (strong, nonatomic) IBOutlet UIView *viewEmptyMessage;

@end
