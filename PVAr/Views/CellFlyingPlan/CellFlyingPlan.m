//
//  UITableViewCell+CellFlyingPlan.m
//  PVAr
//
//  Created by Prisma on 14/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "CellFlyingPlan.h"
#import "Constants.h"

@implementation CellFlyingPlan

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    UIView * selectedBackgroundView = [[UIView alloc] init];
    [selectedBackgroundView setBackgroundColor:CellSelectedColor];
    [self setSelectedBackgroundView:selectedBackgroundView];
}

-(void)configureViews{
    
    self.viewFlingNumber.layer.cornerRadius = 5.0f;
    self.viewFlingNumber.clipsToBounds = true;
    
    self.cellContentViewCustom.layer.cornerRadius = 5.0f;
    self.cellContentViewCustom.clipsToBounds = true;
    
    self.imageViewOrigin.image = [self.imageViewOrigin.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.imageViewOrigin setTintColor:AppColor];
    
    self.imageViewRoad.image = [self.imageViewRoad.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.imageViewRoad setTintColor:AppColor];
    
    self.imageViewDestination.image = [self.imageViewDestination.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.imageViewDestination setTintColor:AppColor];
}

- (IBAction)ShowCellActions:(id)sender {
    
}

@end
