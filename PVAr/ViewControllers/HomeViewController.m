//
//  UIViewController+HomeViewController.m
//  PVAr
//
//  Created by Prisma on 12/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "Constants.h"
#import "ShowAlert.h"
#import "ContainerViewController.h"
#import "PendingFlyingPlansViewController.h"
#import "AcceptedFlyingPlansViewController.h"
#import "CancelledFlyingPlansViewController.h"

const int tabsNumber = 3;

@interface HomeViewController(){
    NSArray *viewControllers;
    NSArray *tagTitles;
}
@property (nonatomic, weak) ContainerViewController *containerViewController;

@end

@implementation HomeViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self.scrollSegmentControll setContentSize:CGSizeMake(self.scrollSegmentControll.contentSize.width, 0)];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"embedContainer"]) {
        self.containerViewController = segue.destinationViewController;
    }
}

- (IBAction)Logout:(id)sender {
    [ShowAlert ShowAlertWithTitle:@"Logout" andMessage:@"Are you sure you want to quit?" acceptBlock:^{
        [self.navigationController popViewControllerAnimated:YES];
    } cancelBlock:^{
        NSLog(@"Logout Cancelled");
    }];
}

- (IBAction)ChangeSegmentControllPage:(id)sender {
    UIStoryboard *sb = [[AppDelegate sharedAppDelegate] grabStoryboard];
    UIViewController *vc = nil;
    
    if (self.segmentControll.selectedSegmentIndex == 0) {
        // automatic scroll
        [self.scrollSegmentControll setContentOffset:CGPointMake(0, 0) animated:YES];
        // change view controller
        vc = [sb instantiateViewControllerWithIdentifier:@"PendingFlyingPlansViewController"];
    }else if (self.segmentControll.selectedSegmentIndex == 1) {
        // automatic scroll
        CGPoint bottomOffset = CGPointMake((self.scrollSegmentControll.contentSize.width - self.scrollSegmentControll.bounds.size.width)/2,0);
        [self.scrollSegmentControll setContentOffset:bottomOffset animated:YES];
        // change view controller
        vc = [sb instantiateViewControllerWithIdentifier:@"AcceptedFlyingPlansViewController"];
    }else if (self.segmentControll.selectedSegmentIndex == 2) {
        // automatic scroll
        CGPoint bottomOffset = CGPointMake((self.scrollSegmentControll.contentSize.width - self.scrollSegmentControll.bounds.size.width),0);
        [self.scrollSegmentControll setContentOffset:bottomOffset animated:YES];
        // change view controller
        vc = [sb instantiateViewControllerWithIdentifier:@"CancelledFlyingPlansViewController"];
    }

    [self.containerViewController swapViewControllers:vc];
}
@end
