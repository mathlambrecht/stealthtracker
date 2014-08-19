//
//  SummaryView.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 13/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Polygon.h"
#import "Button.h"
#import "Label.h"
#import "DecibelHUD.h"
#import "LuxHUD.h"
#import "KillDeathRatioView.h"

@interface SummaryView : UIView

@property(nonatomic, readwrite)BOOL isListItem;

@property(strong, nonatomic)Polygon *polyTimer;
@property(strong, nonatomic)Polygon *polyResult;
@property(strong, nonatomic)Button *btnResult;
@property(strong, nonatomic)Label *lblResult;

@property(strong, nonatomic)DecibelHUD *decibelHUD;
@property(strong, nonatomic)LuxHUD *luxHUD;

@property(strong, nonatomic)Polygon *polyAvgDB;
@property(strong, nonatomic)Polygon *polyAvgLux;

@property(strong, nonatomic)KillDeathRatioView *kdRatio;

-(id)initWithFrame:(CGRect)frame andIsListItem:(BOOL)isListItem;

@end
