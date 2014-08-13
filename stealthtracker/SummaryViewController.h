//
//  SummaryViewController.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 13/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SummaryView.h"

@interface SummaryViewController : UIViewController

@property(strong, nonatomic) SummaryView *view;
@property(strong) BOOL isListItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andIsListItem:(BOOL)isListItem;

@end
