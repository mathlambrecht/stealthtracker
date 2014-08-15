//
//  SummaryView.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 13/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "SummaryView.h"

@implementation SummaryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0.02 green:0.09 blue:0.12 alpha:1];
        
        [self createDashboard];
    }
    
    return self;
}

-(void)createDashboard
{
    UIImage *image = [UIImage imageNamed:@"polyTimer.png"];
    self.polyTimer = [[Polygon alloc] initWithFrame:CGRectMake(10, 15, image.size.width, image.size.height) polygon:image value:0 label:@"skirm time"];
    self.polyTimer.lblValue.text = @"";
    [self addSubview:self.polyTimer];
    
    self.btnResult = [[Button alloc] initWithFrame:CGRectMake(self.polyTimer.frame.origin.x + self.polyTimer.frame.size.width + 20, 15, image.size.width, image.size.height) andString:@"win"];
    [self.btnResult setImage:image forState:UIControlStateNormal];
    [self addSubview:self.btnResult];
    
    self.lblResult = [[Label alloc] initWithFrame:CGRectMake(self.btnResult.center.x - self.lblResult.frame.size.width/2, self.btnResult.frame.origin.y + self.btnResult.frame.size.height + 5, 50, 25) andString:@"result"];
    [self addSubview:self.lblResult];
    
    self.decibelHUD = [[DecibelHUD alloc] initWithFrame:CGRectMake(0, -30, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self addSubview:self.decibelHUD];
    self.decibelHUD.dB = -25;
    
    self.luxHUD = [[LuxHUD alloc] initWithFrame:CGRectMake(0, -30, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.luxHUD.lux = 0.5;
    [self addSubview:self.luxHUD];
    
    self.kdRatio = [[KillDeathRatioView alloc] initWithFrame:CGRectMake(20, 420, [UIScreen mainScreen].bounds.size.width, 100) andIsTrackingScreen:false andKills:0 andDeaths:0];
    [self addSubview:self.kdRatio];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
