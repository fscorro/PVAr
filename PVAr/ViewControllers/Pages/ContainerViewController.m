//
//  ContainerViewController.m
//  EmbeddedSwapping
//
//  Created by Michael Luton on 11/13/12.
//  Copyright (c) 2012 Sandmoose Software. All rights reserved.
//  Heavily inspired by http://orderoo.wordpress.com/2012/02/23/container-view-controllers-in-the-storyboard/
//

#import "ContainerViewController.h"
#import "AppDelegate.h"
#import "CotizacionViewController.h"
#import "ConvertirViewController.h"
#import "GraficoViewController.h"

#define SegueIdentifierFirst @"embedFirst"
#define SegueIdentifierSecond @"embedSecond"
#define SegueIdentifierThird @"embedThird"

@interface ContainerViewController ()

@property (strong, nonatomic) NSString *currentSegueIdentifier;
@property (strong, nonatomic) NSString *oldtSegueIdentifier;
@property (strong, nonatomic) CotizacionViewController *firstViewController;
@property (strong, nonatomic) ConvertirViewController *secondViewController;
@property (strong, nonatomic) GraficoViewController *thirdViewController;
@property (assign, nonatomic) BOOL transitionInProgress;

@end

@implementation ContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.transitionInProgress = NO;
    self.currentSegueIdentifier = SegueIdentifierFirst;
    self.oldtSegueIdentifier = self.currentSegueIdentifier;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);

    // Instead of creating new VCs on each seque we want to hang on to existing
    // instances if we have it. Remove the second condition of the following
    // two if statements to get new VC instances instead.
    if ([segue.identifier isEqualToString:SegueIdentifierFirst]) {
        self.firstViewController = segue.destinationViewController;
    }else if ([segue.identifier isEqualToString:SegueIdentifierSecond]) {
        self.secondViewController = segue.destinationViewController;
    }else if ([segue.identifier isEqualToString:SegueIdentifierThird]) {
        self.thirdViewController = segue.destinationViewController;
    }

    // If we're going to the first view controller.
    if ([segue.identifier isEqualToString:SegueIdentifierFirst]) {
        // If this is not the first time we're loading this.
        if (self.childViewControllers.count > 0) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.firstViewController];
        }
        else {
            // If this is the very first time we're loading this we need to do
            // an initial load and not a swap.
            [self addChildViewController:segue.destinationViewController];
            UIView* destView = ((UIViewController *)segue.destinationViewController).view;
            destView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            destView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:destView];
            [segue.destinationViewController didMoveToParentViewController:self];
        }
    }
    // By definition the second view controller will always be swapped with the
    // first one.
    else if ([segue.identifier isEqualToString:SegueIdentifierSecond]) {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.secondViewController];
    } else if ([segue.identifier isEqualToString:SegueIdentifierThird]) {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.thirdViewController];
    }
}

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self.oldtSegueIdentifier = self.currentSegueIdentifier;

    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];

    [self transitionFromViewController:fromViewController toViewController:toViewController duration:0.01 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
        self.transitionInProgress = NO;
    }];
}

- (void)swapViewControllers:(UIViewController *)toViewController
{
    NSLog(@"%s", __PRETTY_FUNCTION__);

    if (self.transitionInProgress) {
        return;
    }
    self.transitionInProgress = YES;
    
    if ([toViewController isKindOfClass:[CotizacionViewController class]]) {
        self.currentSegueIdentifier = SegueIdentifierFirst;
    }else if ([toViewController isKindOfClass:[ConvertirViewController class]]) {
        self.currentSegueIdentifier = SegueIdentifierSecond;
    }else if ([toViewController isKindOfClass:[GraficoViewController class]]) {
        self.currentSegueIdentifier = SegueIdentifierThird;
    }
    
    if ([self.oldtSegueIdentifier isEqualToString:SegueIdentifierFirst] ){
        if ([toViewController isKindOfClass:[ConvertirViewController class]] && self.secondViewController) {
            [self swapFromViewController:self.firstViewController toViewController:self.secondViewController];
            return;
        }else if ([toViewController isKindOfClass:[GraficoViewController class]] && self.thirdViewController) {
            [self swapFromViewController:self.firstViewController toViewController:self.thirdViewController];
            return;
        }
    }
    
    if ([self.oldtSegueIdentifier isEqualToString:SegueIdentifierSecond] ){
        if ([toViewController isKindOfClass:[CotizacionViewController class]] && self.firstViewController) {
            [self swapFromViewController:self.secondViewController toViewController:self.firstViewController];
            return;
        }else if ([toViewController isKindOfClass:[GraficoViewController class]] && self.thirdViewController) {
            [self swapFromViewController:self.secondViewController toViewController:self.thirdViewController];
            return;
        }
    }

    if ([self.oldtSegueIdentifier isEqualToString:SegueIdentifierThird] ){
        if ([toViewController isKindOfClass:[CotizacionViewController class]] && self.firstViewController) {
            [self swapFromViewController:self.thirdViewController toViewController:self.firstViewController];
            return;
        }else if ([toViewController isKindOfClass:[ConvertirViewController class]] && self.secondViewController) {
            [self swapFromViewController:self.thirdViewController toViewController:self.secondViewController];
            return;
        }
    }
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

@end
