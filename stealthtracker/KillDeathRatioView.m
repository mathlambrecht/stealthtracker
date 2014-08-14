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
            //buttons
            [self createButtons];
        }
        else
        {
            //polygons
            [self createPolys];
        }
    }
    
    [self createRatio];
    
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
    
    self.polyDeaths = [[Polygon alloc] initWithFrame:CGRectMake(108, self.polyKills.frame.origin.y, image.size.width, image.size.height)  polygon:image value:_deaths label:@"deaths"];
    [self addSubview:self.polyDeaths];
    
    self.pointA = CGPointMake(image.size.width, image.size.height/2);
    self.pointB = CGPointMake(216, self.pointA.y);
}

-(void)createRatio
{
    CALayer *caLayer = [CALayer layer];
    caLayer.position = CGPointMake(0, 0);
    [self.layer addSublayer:caLayer];
    
    //CGPoint pointRatio = CGPointMake(<#CGFloat x#>, <#CGFloat y#>)
    
    //CGPoint redA;
    //CGPoint redB;
    
    CAShapeLayer *lineRed = [CAShapeLayer layer];
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:self.pointA];
    [linePath addLineToPoint:self.pointB];
    lineRed.path = linePath.CGPath;
    lineRed.fillColor = nil;
    lineRed.opacity = 1.0;
    lineRed.lineWidth = 2;
    lineRed.strokeColor = [UIColor colorWithRed:0.83 green:0.19 blue:0.19 alpha:1].CGColor;
    [caLayer addSublayer:lineRed];
    
    //CGPoint whiteA;
    //CGPoint whiteB;
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
