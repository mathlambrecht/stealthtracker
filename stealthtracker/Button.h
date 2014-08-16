//
//  Button.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 01/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelperFactory.h"

@interface Button : UIButton

@property(nonatomic) int value;

-(id)initWithFrame:(CGRect)frame andString:(NSString *)string;

@end
