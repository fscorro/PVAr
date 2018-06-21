//
//  UIViewController+CreateSupplementaryInformation.h
//  PVAr
//
//  Created by Roberto Daviduk on 20/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RKDropdownAlert.h>
#import <XLForm.h>
#import <XLFormViewController.h>

@class CreateSupplementaryInformation;
@protocol CreateSupplementaryInformationDelegate <NSObject>
- (void)delegateVC:(CreateSupplementaryInformation *)vc dicSupplementary:(NSMutableDictionary*)dic;
@end


@interface CreateSupplementaryInformation : XLFormViewController

@property (weak, nonatomic) id<CreateSupplementaryInformationDelegate> delegate;

@end
