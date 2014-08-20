//
//  GraphView.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 20/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "GraphView.h"

@implementation GraphView

float width;
float height;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0.02 green:0.09 blue:0.12 alpha:1];
        
        width = self.frame.size.width;
        height = self.frame.size.height;
        
        self.container = [CALayer layer];
        self.container.frame = CGRectMake(8, 0, width - 32, height - 74);
        [self.layer addSublayer:self.container];
        
        CAShapeLayer *graphLine = [CAShapeLayer layer];
        UIBezierPath *graphLinePath = [UIBezierPath bezierPath];
        [graphLinePath moveToPoint:CGPointMake(self.container.frame.origin.x, self.container.frame.origin.y)];
        [graphLinePath addLineToPoint:CGPointMake(self.container.frame.origin.x, self.container.frame.origin.y + self.container.frame.size.height)];
        graphLine.path = graphLinePath.CGPath;
        graphLine.fillColor = nil;
        graphLine.opacity = 1.0;
        graphLine.lineWidth = 1;
        graphLine.opacity = 0.3;
        graphLine.strokeColor = [UIColor colorWithRed:0.73 green:0.8 blue:0.82 alpha:1].CGColor;
        [self.container addSublayer:graphLine];
        
        NSArray *arrDB = [[AppModel getInstance] arrDB];
        float distance = self.container.frame.size.height / [arrDB count];
        CGPoint pointA = CGPointMake(self.container.frame.origin.x, self.container.frame.origin.y);
        CGPoint pointB = CGPointMake(self.container.frame.origin.x + fabsf([[[[AppModel getInstance] arrDB] objectAtIndex:0] floatValue]) / 120 * self.container.frame.size.width, self.container.frame.origin.y + distance);
        
        for(NSNumber *number in arrDB)
        {
            float value = fabsf([number floatValue]);
            value = value / 120 * self.container.frame.size.width;
            
            CAShapeLayer *line = [CAShapeLayer layer];
            UIBezierPath *linePath = [UIBezierPath bezierPath];
            
            [linePath moveToPoint:pointA];
            [linePath addLineToPoint:pointB];
            
            line.path=linePath.CGPath;
            line.fillColor = nil;
            line.opacity = 1.0;
            line.lineWidth = 1;
            line.strokeColor = [UIColor colorWithRed:0.83 green:0.19 blue:0.19 alpha:1].CGColor;
            
            [self.container addSublayer:line];
            
            pointA = pointB;
            pointB = CGPointMake(value, pointB.y + distance);
        }
        
        NSArray *arrLux = [[AppModel getInstance] arrLux];
        distance = self.container.frame.size.height / [arrLux count];
        pointA = CGPointMake(self.container.frame.origin.x, self.container.frame.origin.y);
        pointB = CGPointMake(self.container.frame.origin.x + fabsf([[[[AppModel getInstance] arrLux] objectAtIndex:0] floatValue]) * self.container.frame.size.width, self.container.frame.origin.y + distance);
        
        NSLog(@"%f", fabsf([[[[AppModel getInstance] arrLux] objectAtIndex:0] floatValue]) * self.container.frame.size.width);
        
        for(NSNumber *number in arrLux)
        {
            float value = fabsf([number floatValue]);
            
            NSLog(@"%f", value);
            
            value = value * self.container.frame.size.width;
            
            CAShapeLayer *line = [CAShapeLayer layer];
            UIBezierPath *linePath = [UIBezierPath bezierPath];
            
            [linePath moveToPoint:pointA];
            [linePath addLineToPoint:pointB];
            
            line.path=linePath.CGPath;
            line.fillColor = nil;
            line.opacity = 1.0;
            line.lineWidth = 1;
            line.strokeColor = [UIColor colorWithRed:0.73 green:0.8 blue:0.82 alpha:1].CGColor;
            
            [self.container addSublayer:line];
            
            pointA = pointB;
            pointB = CGPointMake(value, pointB.y + distance);
        }
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
