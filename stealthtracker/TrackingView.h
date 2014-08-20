//
//  TrackingView.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 07/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Button.h"
#import "Polygon.h"
#import "DecibelHUD.h"
#import "LuxHUD.h"
#import "KillDeathRatioView.h"

@interface TrackingView : UIView

@property(strong, nonatomic)Button *btnPause;
@property(strong, nonatomic)Button *btnResume;
//@property(strong, nonatomic)Polygon *btnEnd;
@property(strong, nonatomic)Button *btnEnd;
@property(strong, nonatomic)CALayer *lineCA;

@property(nonatomic) int seconds;
@property(strong, nonatomic) Polygon *polyTimer;

@property(strong, nonatomic) DecibelHUD *decibelHUD;
@property(strong, nonatomic) LuxHUD *luxHud;

@property(strong, nonatomic)KillDeathRatioView *killDeathRatioView;

@property(nonatomic)CGPoint btnEndOriginalPosition;
@property(nonatomic)CGPoint touchStart;

@property(strong, nonatomic)Polygon *polyAvgDB;
@property(strong, nonatomic)Polygon *polyAvgLux;

-(void)showOptions:(BOOL)isPaused;

@end
