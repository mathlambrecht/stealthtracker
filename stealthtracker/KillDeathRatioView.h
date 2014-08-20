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

@property (nonatomic, readwrite) BOOL isTrackingScreen;

@property(nonatomic, readwrite) int kills;
@property(nonatomic, readwrite) int deaths;

@property(strong, nonatomic) Label *lblKill;
@property(strong, nonatomic) Label *lblDeath;
@property(strong, nonatomic) Button *btnKill;
@property(strong, nonatomic) Button *btnDeath;

@property(strong, nonatomic) Polygon *polyKills;
@property(strong, nonatomic) Polygon *polyDeaths;
@property(strong, nonatomic) Polygon *polyRatio;
@property(strong, nonatomic) Label *lblRatio;

@property(strong, nonatomic) CALayer *container;
@property(strong, nonatomic) CAShapeLayer *lineRed;
@property(strong, nonatomic) CAShapeLayer *lineWhite;
@property(strong, nonatomic) UIBezierPath *bezierRed;
@property(strong, nonatomic) UIBezierPath *bezierWhite;

@property(nonatomic) CGPoint pointA;
@property(nonatomic) CGPoint pointB;

-(id)initWithFrame:(CGRect)frame andIsTrackingScreen:(BOOL)isTrackingScreen andKills:(int)kills andDeaths:(int)deaths;
-(void)updateRatio;

@end
