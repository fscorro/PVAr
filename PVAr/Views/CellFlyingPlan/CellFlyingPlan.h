//
//  UITableViewCell+CellFlyingPlan.h
//  PVAr
//
//  Created by Prisma on 14/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellFlyingPlan : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *cellContentViewCustom;

@property (strong, nonatomic) IBOutlet UIView *viewFlingNumber;
@property (strong, nonatomic) IBOutlet UIButton *buttonCellAction;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewOrigin;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewRoad;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewDestination;

- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
-(void)configureViews;
- (IBAction)ShowCellActions:(id)sender;

@end
