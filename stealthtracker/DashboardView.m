//
//  DashboardView.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 31/07/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "DashboardView.h"

@implementation DashboardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0.02 green:0.09 blue:0.12 alpha:1];
        
        //create HUD
        [self createTopPolys];
        [self createHUD];
        [self createBottomPolys];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame andKills:(int)kills andDeaths:(int)deaths
{    
    self.kills = kills;
    self.deaths = deaths;
    
    return [self initWithFrame:frame];
}

-(void)createTopPolys
{
    UIImage *image = [UIImage imageNamed:@"polyDefault.png"];
    self.polyTotalSkirms = [[Polygon alloc] initWithFrame:CGRectMake(10, 15, image.size.width, image.size.height) polygon:image value:0 label:@"skirms"];
    self.polyTotalSkirms.alpha = 0.5;
    [self addSubview:self.polyTotalSkirms];
    
    self.polyWins = [[Polygon alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/4 - image.size.width/4, self.polyTotalSkirms.frame.origin.y, image.size.width, image.size.height) polygon:image value:0 label:@"wins"];
    self.polyWins.alpha = 0.5;
    [self addSubview:self.polyWins];
    
    self.polyLosses = [[Polygon alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - image.size.width/2 - 10, self.polyWins.frame.origin.y, image.size.width, image.size.height)
                       polygon:image value:0 label:@"losses"];
    self.polyLosses.alpha = 0.5;
    [self addSubview:self.polyLosses];
}

-(void)createHUD
{
    self.decibelHUD = [[DecibelHUD alloc] initWithFrame:CGRectMake(0, -30, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self addSubview:self.decibelHUD];
    self.decibelHUD.dB = [HelperFactory calculateAverageDb];
    
    self.luxHUD = [[LuxHUD alloc] initWithFrame:CGRectMake(0, -30, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.luxHUD.lux = [HelperFactory calculateAverageLux] / 1000;
    [self addSubview:self.luxHUD];
    
    UIImage *image = [UIImage imageNamed:@"polyDefault.png"];
    self.polyAvgDB = [[Polygon alloc] initWithFrame:CGRectMake(36, 115, image.size.width, image.size.height) polygon:image value:0 label:@"Avg. dB"];
    [self addSubview:self.polyAvgDB];
    
    self.polyAvgLux = [[Polygon alloc] initWithFrame:CGRectMake(self.polyAvgDB.frame.origin.x + self.polyAvgDB.frame.size.width - 7, self.polyAvgDB.frame.origin.y, image.size.width, image.size.height) polygon:image value:0 label:@"Avg. Lux"];
    [self addSubview:self.polyAvgLux];
}

-(void)createBottomPolys
{
    self.killDeathRatioView = [[KillDeathRatioView alloc] initWithFrame:CGRectMake(20, 420, [UIScreen mainScreen].bounds.size.width, 100) andIsTrackingScreen:false andKills:self.kills andDeaths:self.deaths];
    [self addSubview:self.killDeathRatioView];
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
