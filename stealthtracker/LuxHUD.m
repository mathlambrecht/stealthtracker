//
//  LuxHUD.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 12/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "LuxHUD.h"

@implementation LuxHUD
@synthesize lux = _lux;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        [self createHUD];
    }
    return self;
}

-(void)createHUD
{
    int r = 115;
    int pieces = 20;
    
    self.container = [CALayer layer];
    
    for (int i = 0; i < pieces; i++)
    {
        float x  = r * cos( (180/pieces * i) * M_PI/180);
        float y = r * sin( (180/pieces * i) * M_PI/180);
        
        CAShapeLayer *hudLayer  = [CAShapeLayer layer];
        hudLayer.contents = (id) [UIImage imageNamed:@"hudDB"].CGImage;
        hudLayer.frame = CGRectMake(x, y, 20, 15);
        hudLayer.transform = CATransform3DMakeRotation( (266 + 180/pieces * i) * M_PI/180, 0, 0, 1);
        hudLayer.opacity = 0.1;
        [self.container addSublayer:hudLayer];
    }
    
    self.container.position = CGPointMake( self.frame.size.width / 2, self.frame.size.height / 2);
    self.container.transform = CATransform3DMakeRotation(94 * M_PI/180, 0, 0, 1);
    self.container.transform = CATransform3DScale(CATransform3DMakeRotation(M_PI / 2.0f, 0, 0, 1), 1, -1, 1);
    [self.layer addSublayer:self.container];
}

-(void)setLux:(float)lux
{
    if(_lux != lux)
    {
        _lux = lux;
        
        [self updateHUD:_lux];
    }
}

-(void)updateHUD:(float)lux
{
    float convertedLux = lux * 20;
    
    int i = 0;
    
    for (CAShapeLayer *shapeLayer in self.container.sublayers)
    {
        if(i < convertedLux)
        {
            shapeLayer.opacity = 0 + (i * 0.05);
            
            i++;
        }
        else
        {
            shapeLayer.opacity = 0.1;
        }
    }
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
