//
//  SkirmDO.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 08/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "SkirmDO.h"

@implementation SkirmDO

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self forKey:@"userId"];
    [aCoder encodeObject:self forKey:@"time"];
    [aCoder encodeObject:self forKey:@"arrDB"];
    [aCoder encodeObject:self forKey:@"arrLux"];
    [aCoder encodeObject:self forKey:@"kills"];
    [aCoder encodeObject:self forKey:@"deaths"];
    [aCoder encodeObject:self forKey:@"result"];
}

@end
