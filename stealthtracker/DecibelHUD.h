//
//  DecibelHUD.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 11/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface DecibelHUD : UIView

@property(nonatomic, readwrite) float dB;
@property (nonatomic, strong) CALayer *container;

@end
