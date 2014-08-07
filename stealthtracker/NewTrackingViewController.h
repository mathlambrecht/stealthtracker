//
//  NewTrackingViewController.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 07/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewTrackingView.h"
#import "AppModel.h"
#import "HelperFactory.h"
#import "TrackingViewController.h"

@interface NewTrackingViewController : UIViewController

@property(strong, nonatomic) AppModel *appModel;
@property(strong, nonatomic) NewTrackingView *view;

@end
