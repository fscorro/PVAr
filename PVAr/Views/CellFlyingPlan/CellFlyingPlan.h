//
//  UITableViewCell+CellFlyingPlan.h
//  PVAr
//
//  Created by Prisma on 14/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fly.h"

@interface CellFlyingPlan : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *cellContentViewCustom;

@property (strong, nonatomic) IBOutlet UIView *viewFlyState;
@property (strong, nonatomic) IBOutlet UIView *viewFlingNumber;
@property (strong, nonatomic) IBOutlet UILabel *labelFlyAeroplaneID;
@property (strong, nonatomic) IBOutlet UILabel *labelFlyAeroplaneType;
@property (strong, nonatomic) IBOutlet UILabel *labelFlyDate;
@property (strong, nonatomic) IBOutlet UILabel *labelFlyTime;

@property (strong, nonatomic) IBOutlet UILabel *labelFlyOrigin;
@property (strong, nonatomic) IBOutlet UILabel *labelFlyDestination;

@property (strong, nonatomic) IBOutlet UILabel *labelFlySpeed;
@property (strong, nonatomic) IBOutlet UILabel *labelFlyLevel;
@property (strong, nonatomic) IBOutlet UILabel *labelFlyTotalEET;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewOrigin;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewRoad;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewDestination;

- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (void)configureWithFly:(Fly*)fly;

@end
