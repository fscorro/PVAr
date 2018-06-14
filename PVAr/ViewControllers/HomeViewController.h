//
//  UIViewController+HomeViewController.h
//  PVAr
//
//  Created by Prisma on 12/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *logoutButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *moreButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControll;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollSegmentControll;

- (IBAction)Logout:(id)sender;
- (IBAction)ChangeSegmentControllPage:(id)sender;

@end
