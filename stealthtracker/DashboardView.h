//
//  DashboardView.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 31/07/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Polygon.h"

@interface DashboardView : UIView

@property(strong, nonatomic)Polygon *polyTotalSkirms;
@property(strong, nonatomic)Polygon *polyWins;
@property(strong, nonatomic)Polygon *polyLosses;

@end
