//
//  LuxHUD.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 12/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LuxHUD : UIView

@property(nonatomic, readwrite) float lux;
@property (nonatomic, strong) CALayer *container;

@end
