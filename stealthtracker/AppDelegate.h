//
//  AppDelegate.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 31/07/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationController.h"
#import "NavigationBar.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NavigationBar *navigationBar;
@property (strong, nonatomic) NavigationController *navigationController;

@end
