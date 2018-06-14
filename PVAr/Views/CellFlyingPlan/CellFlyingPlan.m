//
//  UITableViewCell+CellFlyingPlan.m
//  PVAr
//
//  Created by Prisma on 14/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "CellFlyingPlan.h"

@implementation CellFlyingPlan

-(void)configureViews{
    self.viewOrigin.layer.cornerRadius = 10.0f;
    self.viewOrigin.clipsToBounds = YES;

    self.viewDestination.layer.cornerRadius = 10.0f;
    self.viewDestination.clipsToBounds = YES;
    
    self.viewImageViewFly.layer.cornerRadius = 10.0f;
    self.viewImageViewFly.clipsToBounds = YES;

    self.imageViewFly.image = [self.imageViewFly.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.imageViewFly setTintColor:[UIColor groupTableViewBackgroundColor]];
}

@end
