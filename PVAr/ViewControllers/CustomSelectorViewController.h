//
//  UIViewController+CustomSelectorViewController.h
//  PVAr
//
//  Created by Roberto Daviduk on 24/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomSelectorViewController;
@protocol CustomSelectorDelegate <NSObject>
- (void)delegateVC:(CustomSelectorViewController *)vc option:(NSString*)option;
@end

@interface CustomSelectorViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableViewSelector;

@property (weak, nonatomic) id<CustomSelectorDelegate> delegate;
@property (strong, nonatomic) NSString *selectedOption;
@property (strong, nonatomic) NSString *tag;

@end
