//
//  DecibelHUD.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 11/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "DecibelHUD.h"

@implementation DecibelHUD

@synthesize dB = _dB;

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
    int r = 110;
    int pieces = 19;
    
    for (int i = 0; i < 19; i++)
    {
        float x  = [UIScreen mainScreen].bounds.size.width/2 +  r * cos( (180/pieces * i) * M_PI/180);
        float y = [UIScreen mainScreen].bounds.size.width/2 + r * sin( (180/pieces * i) * M_PI/180);
        
        CALayer *sublayer  = [CALayer layer];
        sublayer.contents = (id) [UIImage imageNamed:@"hudDB"].CGImage;
        sublayer.frame = CGRectMake(x, y, 20, 15);
        
        [self.layer addSublayer:sublayer];
    }
}

-(void)setDB:(NSNumber *)dB
{
    if(_dB != dB)
    {
        _dB = dB;
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
