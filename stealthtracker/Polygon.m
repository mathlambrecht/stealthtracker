//
//  Polygon.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 08/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "Polygon.h"

@implementation Polygon

- (id)initWithFrame:(CGRect)frame polygon:(UIImage *)image label:(NSString *)string
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = frame;
        [self addSubview:imageView];
        
        self.lblValue = [[Label alloc] initWithFrame:frame andString:@"X"];
        [self addSubview:self.lblValue];
        
        //Label *label = [[Label alloc] initWithFrame:frame andString:@"Skirms"];
        //[self addSubview:label];
    }
    return self;
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
