//
//  UITableViewCell+CellFlyingPlan.h
//  PVAr
//
//  Created by Prisma on 14/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellFlyingPlan : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelFlyingNumber;
@property (weak, nonatomic) IBOutlet UILabel *labelFlyingDateTime;

@property (weak, nonatomic) IBOutlet UIView *viewOrigin;
@property (weak, nonatomic) IBOutlet UILabel *labelFlyingOrigin;

@property (weak, nonatomic) IBOutlet UIView *viewDestination;
@property (weak, nonatomic) IBOutlet UILabel *labelFlyingDestination;

@property (weak, nonatomic) IBOutlet UIView *viewImageViewFly;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewFly;

-(void)configureViews;

@end
