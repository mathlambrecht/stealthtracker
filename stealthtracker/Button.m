//
//  Button.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 01/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "Button.h"

@implementation Button

- (id)initWithFrame:(CGRect)frame andString:(NSString *)string
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.tintColor = [UIColor colorWithRed:0.73 green:0.8 blue:0.82 alpha:1];
        self.titleLabel.font = [UIFont fontWithName:@"Arame-Thin" size:14];
        [self setTitleColor:[UIColor colorWithRed:0.73 green:0.8 blue:0.82 alpha:1] forState:UIControlStateNormal];
        [self setAttributedTitle:[HelperFactory createAttributedString:string] forState:UIControlStateNormal];
    }
    return self;
}

//- (void)setTitleFont:(UIFont *)font
//{
//    if (_titleFont != font)
//    {
//        _titleFont = font;
//        self.titleLabel.font = font;
//    }
//}

//- (void)initWithFrame:(CGRect)frame andString:(NSString *)string
//{
//    [self initWithFrame:frame];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end