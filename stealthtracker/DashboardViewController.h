//
//  DashboardViewController.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 31/07/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "AppModel.h"
#import "DashboardView.h"
#import "NewTrackingViewController.h"
#import "SkirmDO.h"
#import "OverviewViewController.h"

@interface DashboardViewController : UIViewController

@property (strong, nonatomic) AppModel *appModel;
@property (strong, nonatomic) DashboardView *view;

@end
