//
//  SummaryViewController.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 13/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppModel.h"
#import "SummaryView.h"
#import "HelperFactory.h"
#import "DashboardViewController.h"
#import "DatabaseService.h"
#import "GraphViewController.h"

@interface SummaryViewController : UIViewController

@property(strong, nonatomic) AppModel *appModel;
@property(strong, nonatomic) SummaryView *view;
@property(nonatomic) BOOL isListItem;
@property(strong, nonatomic) DatabaseService *dbService;

-(id)initWithIsListItem:(BOOL)isListItem;

@end
