//
//  Button.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 01/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "Button.h"

@implementation Button
@synthesize value = _value;

- (id)initWithFrame:(CGRect)frame andString:(NSString *)string
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.tintColor = [UIColor colorWithRed:0.73 green:0.8 blue:0.82 alpha:1];
        self.titleLabel.font = [UIFont fontWithName:@"Arame-Thin" size:14];
        [self setAttributedTitle:[HelperFactory createAttributedString:string] forState:UIControlStateNormal];
        [self setAttributedTitle:[HelperFactory createAttributedHighlightString:string] forState:UIControlStateHighlighted];
    }
    
    return self;
}

-(void)setValue:(int)value
{
    if(_value != value)
    {
        _value = value;
        
        [self setAttributedTitle:[HelperFactory createAttributedString:[NSString stringWithFormat:@"%i", value]] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithRed:0.73 green:0.8 blue:0.82 alpha:1] forState:UIControlStateNormal];
    }
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    if (highlighted)
    {
        [self setTitleColor:[UIColor colorWithRed:0.38 green:0.45 blue:0.47 alpha:1] forState:UIControlStateHighlighted];
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
