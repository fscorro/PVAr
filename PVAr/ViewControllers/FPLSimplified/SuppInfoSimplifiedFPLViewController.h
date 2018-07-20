//
//  UITableViewCell+SuppInfoSimplifiedFPLViewController.h
//  PVAr
//
//  Created by Roberto Daviduk on 20/7/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RKDropdownAlert.h>
#import <XLForm.h>
#import <XLFormViewController.h>

@class SuppInfoSimplifiedFPLViewController;
@protocol SuppInfoSimplifiedFPLViewControllerDelegate <NSObject>
- (void)delegateVC:(SuppInfoSimplifiedFPLViewController *)vc dicSupplementary:(NSMutableDictionary*)dic;
@end

@interface SuppInfoSimplifiedFPLViewController : XLFormViewController

@property (weak, nonatomic) id<SuppInfoSimplifiedFPLViewControllerDelegate> delegate;
@property (strong, nonatomic) NSMutableDictionary *dicSupplementary;

@end
