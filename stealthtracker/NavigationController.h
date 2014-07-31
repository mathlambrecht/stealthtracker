//
//  NavigationController.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 31/07/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DashboardViewController.h"

@interface NavigationController : UINavigationController

@property (strong, nonatomic) DashboardViewController *dashboardViewController;

@property (strong, nonatomic) UIBarButtonItem *btnMenu;
@property (strong, nonatomic) UIImageView *imgViewLogo;
@property (strong, nonatomic) UIBarButtonItem * btnNewTracking;

@end
