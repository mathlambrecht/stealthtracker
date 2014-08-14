//
//  KillDeathRatioView.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 14/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "KillDeathRatioView.h"

@implementation KillDeathRatioView
@synthesize isTrackingScreen = _isTrackingScreen;
@synthesize kills = _kills;
@synthesize deaths = _deaths;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        if(_isTrackingScreen)
        {
            [self createButtons];
        }
        else
        {
            [self createPolys];
        }
        
        [self createRatio];
        [self updateRatio];
    }
    
    return self;
}

-(id)initWithFrame:(CGRect)frame andIsTrackingScreen:(BOOL)isTrackingScreen andKills:(int)kills andDeaths:(int)deaths
{
    _isTrackingScreen = isTrackingScreen;
    _kills = kills;
    _deaths = deaths;
    
    return [self initWithFrame:frame];
}

-(void)createButtons
{
    UIImage *image = [UIImage imageNamed:@"polyDefault.png"];
    self.btnKill = [[Button alloc] initWithFrame:CGRectMake(20, [UIScreen mainScreen].bounds.size.height - image.size.height - 40, image.size.width, image.size.height) andString:@"0"];
    [self.btnKill setBackgroundImage:image forState:UIControlStateNormal];
    [self addSubview:self.btnKill];
    
    self.lblKill = [[Label alloc] initWithFrame:CGRectMake(self.btnKill.frame.origin.x + self.btnKill.frame.size.width/2 - 50, self.btnKill.frame.origin.y + self.btnKill.frame.size.height + 5, 100, 30) andString:@"Kills"];
    [self addSubview:self.lblKill];
    
    self.btnDeath = [[Button alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - image.size.width - 20, [UIScreen mainScreen].bounds.size.height - image.size.height - 40, image.size.width, image.size.height) andString:@"0"];
    [self.btnDeath setBackgroundImage:image forState:UIControlStateNormal];
    [self addSubview:self.btnDeath];
    
    self.lblDeath = [[Label alloc] initWithFrame:CGRectMake(self.btnDeath.frame.origin.x + self.btnDeath.frame.size.width/2 - 50, self.btnDeath.frame.origin.y + self.btnDeath.frame.size.height + 5, 100, 30) andString:@"Deaths"];
    [self addSubview:self.lblDeath];
    
    self.pointA = CGPointMake(image.size.width, image.size.height/2);
    self.pointB = CGPointMake([UIScreen mainScreen].bounds.size.width - image.size.width * 2 - 20, self.pointA.y);
}

-(void)createPolys
{
    UIImage *image = [UIImage imageNamed:@"polyDefault.png"];
    self.polyKills = [[Polygon alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height) polygon:image value:_kills label:@"kills"];
    [self addSubview:self.polyKills];
    
    self.polyDeaths = [[Polygon alloc] initWithFrame:CGRectMake(108, self.polyKills.frame.origin.y, image.size.width, image.size.height)  polygon:image value:_deaths label:@"ratio"];
    [self addSubview:self.polyDeaths];
    
    self.pointA = CGPointMake(image.size.width, image.size.height/2);
    self.pointB = CGPointMake(216, self.pointA.y);
}

-(void)createRatio
{
    self.container = [CALayer layer];
    self.container.position = CGPointMake(0, 0);
    [self.layer addSublayer:self.container];
    
    self.lineRed = [CAShapeLayer layer];
    self.bezierRed = [UIBezierPath bezierPath];
    
    self.lineWhite = [CAShapeLayer layer];
    self.bezierWhite = [UIBezierPath bezierPath];
    
    [self.container addSublayer:self.lineRed];
    
    UIImage *image = [UIImage imageNamed:@"polyRatio.png"];
    self.polyRatio = [[Polygon alloc] initWithFrame:CGRectMake(50, self.pointA.y - image.size.height/2 - 3.5, image.size.width, image.size.height) polygon:image value:self.kills/self.deaths label:@""];
    [self addSubview:self.polyRatio];
}

-(void)updateRatio
{
    float scale = (self.pointB.x - self.pointA.x)/100;
    
    [self.bezierWhite moveToPoint:self.pointA];
    [self.bezierWhite addLineToPoint:self.pointB];
    self.lineRed.path = self.bezierWhite.CGPath;
    self.lineRed.fillColor = nil;
    self.lineRed.opacity = 1.0;
    self.lineRed.lineWidth = 2;
    self.lineRed.strokeColor = [UIColor colorWithRed:0.83 green:0.19 blue:0.19 alpha:1].CGColor;
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
