//
//  DashboardView.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 31/07/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Polygon.h"
#import "KillDeathRatioView.h"
#import "DecibelHUD.h"
#import "LuxHUD.h"

@interface DashboardView : UIView

@property(strong, nonatomic)Polygon *polyTotalSkirms;
@property(strong, nonatomic)Polygon *polyWins;
@property(strong, nonatomic)Polygon *polyLosses;

@property(strong, nonatomic)KillDeathRatioView *killDeathRatioView;

@property(nonatomic) int kills;
@property(nonatomic) int deaths;

@property(strong, nonatomic)DecibelHUD *decibelHUD;
@property(strong, nonatomic)LuxHUD *luxHUD;

@property(strong, nonatomic)Polygon *polyAvgDB;
@property(strong, nonatomic)Polygon *polyAvgLux;

-(id)initWithFrame:(CGRect)frame andKills:(int)kills andDeaths:(int)deaths;

@end
