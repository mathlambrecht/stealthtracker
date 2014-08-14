//
//  DashboardView.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 31/07/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Polygon.h"
#import "DecibelHUD.h"
#import "LuxHUD.h"

@interface DashboardView : UIView

@property(strong, nonatomic)Polygon *polyTotalSkirms;
@property(strong, nonatomic)Polygon *polyWins;
@property(strong, nonatomic)Polygon *polyLosses;

@property(strong, nonatomic)DecibelHUD *decibelHUD;
@property(strong, nonatomic)LuxHUD *luxHUD;

@property(strong, nonatomic) Polygon *polyKills;
@property(strong, nonatomic) Polygon *polyDeaths;

@end
