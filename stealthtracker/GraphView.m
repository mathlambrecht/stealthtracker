//
//  GraphView.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 20/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "GraphView.h"
#import "Label.h"

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
    
    //legend labels
    Label *lbldB = [[Label alloc] initWithFrame:CGRectMake(self.container.frame.origin.x + 100, self.container.frame.origin.y + 5, 385, 30) andString:@"dB"];
    lbldB.font = [UIFont systemFontOfSize:12];
    lbldB.textColor = [UIColor colorWithRed:0.91 green:0.21 blue:0.2 alpha:1];
    [lbldB setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
    [self addSubview:lbldB];
    
    Label *lblLux = [[Label alloc] initWithFrame:CGRectMake(self.container.frame.origin.x + 100, self.container.frame.origin.y + 34.5, 385, 30) andString:@"/Lux"];
    lblLux.font = [UIFont systemFontOfSize:12];
    [lblLux setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
    [self addSubview:lblLux];
    
    Label *lblTime = [[Label alloc] initWithFrame:CGRectMake(self.container.frame.origin.x - 4, self.container.frame.origin.y + 466, 50, 50) andString:@"t"];
    lblTime.text = @"t";
    lblTime.font = [UIFont systemFontOfSize:14];
    [lblTime setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
    [self addSubview:lblTime];
    
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
