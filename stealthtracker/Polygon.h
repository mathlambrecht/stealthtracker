//
//  Polygon.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 08/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Label.h"

@interface Polygon : UIView

@property(strong, nonatomic) Label *lblValue;

-(id)initWithFrame:(CGRect)frame polygon:(UIImage *)image label:(NSString *)string;

@end
