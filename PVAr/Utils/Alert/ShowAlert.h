//
//  UIViewController+ShowAlert.h
//  BanelcoMovil
//
//  Created by Prisma on 1/3/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlertBlocks.h"

@interface ShowAlert : UIViewController <UITextFieldDelegate>

+ (ShowAlert *)sharedShowAlert;

+(void) ShowAlertWithTitle:(NSString*)title andMessage:(NSString*)message acceptBlock:(AcceptBlock)accept cancelBlock:(CancelBlock)cancel;
+(void) ShowAlertWithTitle:(NSString*)title andMessage:(NSString*)message acceptBlock:(AcceptBlock)accept;
+(void) ShowAlertRestorePinWithTitle:(NSString*)title acceptBlock:(AcceptBlock)accept cancelBlock:(CancelBlock)cancel;
+(void) ShowAlertRestorePasswordWithTitle:(NSString*)title acceptBlock:(AcceptBlockWithParamethers)accept cancelBlock:(CancelBlock)cancel;
@end
