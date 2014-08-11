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

@interface TrackingView : UIView

@property(strong, nonatomic)Button *btnPause;

@property(nonatomic) int seconds;
@property(strong, nonatomic) Polygon *polyTimer;

@end
