//
//  KillDeathRatioView.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 14/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Polygon.h"
#import "Button.h"
#import "Label.h"

@interface KillDeathRatioView : UIView

-(id)initWithFrame:(CGRect)frame andIsTrackingScreen:(BOOL)isTrackingScreen andKills:(int)kills andDeaths:(int)deaths;

@property (nonatomic, readwrite) BOOL isTrackingScreen;

@property(nonatomic, readwrite) int kills;
@property(nonatomic, readwrite) int deaths;

@property(strong, nonatomic) Label *lblKill;
@property(strong, nonatomic) Label *lblDeath;
@property(strong, nonatomic) Button *btnKill;
@property(strong, nonatomic) Button *btnDeath;

@property(strong, nonatomic) Polygon *polyKills;
@property(strong, nonatomic) Polygon *polyDeaths;

@property(nonatomic) CGPoint pointA;
@property(nonatomic) CGPoint pointB;

@end
