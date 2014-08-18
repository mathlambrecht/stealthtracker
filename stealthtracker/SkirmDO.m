//
//  SkirmDO.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 08/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "SkirmDO.h"

@implementation SkirmDO

-(id)initWithCoder:(NSCoder*)coder
{
    self = [super init];
    {
        if(self)
        {
            self.userId = [[coder decodeObjectForKey:@"userId"] intValue];
            self.time = [[coder decodeObjectForKey:@"time"] intValue];
            self.arrDB = [coder decodeObjectForKey:@"arrDB"];
            self.arrLux = [coder decodeObjectForKey:@"arrLux"];
            self.kills = [[coder decodeObjectForKey:@"kills"] intValue];
            self.deaths = [[coder decodeObjectForKey:@"deaths"] intValue];
            self.result = [[coder decodeObjectForKey:@"result"] intValue];
        }
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:self.userId forKey:@"userId"];
    [aCoder encodeInteger:self.time forKey:@"time"];
    [aCoder encodeObject:self.arrDB forKey:@"arrDB"];
    [aCoder encodeObject:self.arrLux forKey:@"arrLux"];
    [aCoder encodeInteger:self.kills forKey:@"kills"];
    [aCoder encodeInteger:self.deaths forKey:@"deaths"];
    [aCoder encodeInteger:self.result forKey:@"result"];
}

@end