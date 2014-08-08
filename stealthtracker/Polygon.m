//
//  Polygon.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 08/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "Polygon.h"

@implementation Polygon

- (id)initWithFrame:(CGRect)frame polygon:(UIImage *)image value:(int)integer label:(NSString *)string
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = frame;
        [self addSubview:imageView];
        
        self.lblValue = [[ValueLabel alloc] initWithFrame:frame value:integer];
        self.lblValue.frame = CGRectMake(self.frame.origin.x + self.frame.size.width/2 - self.lblValue.frame.size.width/2, self.frame.origin.y + self.frame.size.height/2 - self.lblValue.frame.size.height/2, self.lblValue.frame.size.width, self.lblValue.frame.size.height);
        [self addSubview:self.lblValue];
        
        Label *label = [[Label alloc] initWithFrame:frame andString:string];
        label.frame = CGRectMake(self.frame.origin.x + self.frame.size.width/2 - label.frame.size.width/2, self.frame.size.height - 10, label.frame.size.width, label.frame.size.height);
        [self addSubview:label];
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
