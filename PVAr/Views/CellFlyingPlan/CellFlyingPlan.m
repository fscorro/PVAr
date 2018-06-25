//
//  UITableViewCell+CellFlyingPlan.m
//  PVAr
//
//  Created by Prisma on 14/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "CellFlyingPlan.h"
#import "Constants.h"
#import "Utils.h"

@implementation CellFlyingPlan

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    UIView * selectedBackgroundView = [[UIView alloc] init];
    [selectedBackgroundView setBackgroundColor:CellSelectedColor];
    [self setSelectedBackgroundView:selectedBackgroundView];
}

-(void)configureWithFly:(Fly *)fly{
    if([fly.flyState isEqualToString:@"P"]){
        [self.viewFlyState setBackgroundColor:FlyStatePendingColor];
    }else if([fly.flyState isEqualToString:@"A"]){
        [self.viewFlyState setBackgroundColor:FlyStateAcceptedColor];
    }else if([fly.flyState isEqualToString:@"C"]){
        [self.viewFlyState setBackgroundColor:FlyStateCancelledColor];
    }
    [self.labelFlyAeroplaneID setText:[NSString stringWithFormat:@"Number: %@", fly.aeroplaneNumber]];
    [self.labelFlyAeroplaneType setText:[NSString stringWithFormat:@"Type: %@", fly.aeroplaneType]];
    [self.labelFlyDate setText:[[Utils sharedUtils]dateFormnat:fly.dateTime]];
    [self.labelFlyTime setText:[[Utils sharedUtils]timeFormnat:fly.dateTime]];
    [self.labelFlyOrigin setText:[NSString stringWithFormat:@"Origin: %@", fly.originAerodrome]];
    [self.labelFlyDestination setText:[NSString stringWithFormat:@"Destination: %@", fly.destinationAerodrome]];
    [self.labelFlySpeed setText:fly.speed];
    [self.labelFlyLevel setText:fly.level];
    [self.labelFlyTotalEET setText:fly.EET];

    [self configureViews];
}

-(void)configureViews{
    
    self.viewFlingNumber.layer.cornerRadius = 5.0f;
    self.viewFlingNumber.clipsToBounds = true;
    
    self.cellContentViewCustom.layer.cornerRadius = 5.0f;
    self.cellContentViewCustom.clipsToBounds = true;
    
    self.imageViewOrigin.image = [self.imageViewOrigin.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.imageViewOrigin setTintColor:AppColorLight];
    
    self.imageViewRoad.image = [self.imageViewRoad.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.imageViewRoad setTintColor:AppColorLight];
    
    self.imageViewDestination.image = [self.imageViewDestination.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.imageViewDestination setTintColor:AppColorLight];
    
}
@end
