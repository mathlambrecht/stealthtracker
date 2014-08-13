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
#import "Label.h"

@interface TrackingView : UIView

@property(strong, nonatomic)Button *btnPause;
@property(strong, nonatomic)Button *btnResume;
@property(strong, nonatomic)Button *btnEnd;

@property(nonatomic) int seconds;
@property(strong, nonatomic) Polygon *polyTimer;

@property(strong, nonatomic) DecibelHUD *decibelHUD;
@property(strong, nonatomic) LuxHUD *luxHud;

@property(strong, nonatomic) Button *btnKill;
@property(strong, nonatomic) Button *btnDeath;

@property(strong, nonatomic) Label *lblKill;
@property(strong, nonatomic) Label *lblDeath;

-(void)showOptions:(BOOL)isPaused;

@end
