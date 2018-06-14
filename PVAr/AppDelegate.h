//
//  AppDelegate.h
//  PVAr
//
//  Created by Prisma on 12/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (AppDelegate *)sharedAppDelegate;

-(BOOL)checkNetworkAccess;
-(UIStoryboard *)grabStoryboard;

@end

