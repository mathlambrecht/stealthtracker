//
//  OverviewViewController.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 19/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OverviewView.h"
#import "HelperFactory.h"
#import "OverviewCellButton.h"
#import "AppModel.h"
#import "SummaryViewController.h"

@interface OverviewViewController : UIViewController

@property(strong, nonatomic) AppModel *appModel;
@property(strong, nonatomic) OverviewView *view;
@property(strong, nonatomic) NSMutableArray *arrListItemButtons;

@end
