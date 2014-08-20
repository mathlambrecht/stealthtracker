//
//
//  stealthtracker
//
//  Created by Mathias Lambrecht on 08/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "SkirmDO.h"

@implementation SkirmDO

-(id)init
{
    self = [super init];
    
    if (self)
    {
        self.arrDB = [[NSMutableArray alloc] init];
        self.arrLux = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder*)coder
{
    self = [super init];
    {
        if(self)
        {
            self.userId = [coder decodeIntegerForKey:@"userId"];
            self.time = [coder decodeIntegerForKey:@"time"];
            self.arrDB = [coder decodeObjectForKey:@"arrDB"];
            self.arrLux = [coder decodeObjectForKey:@"arrLux"];
            self.kills = [coder decodeIntegerForKey:@"kills"];
            self.deaths = [coder decodeIntegerForKey:@"deaths"];
            self.result = [coder decodeIntegerForKey:@"result"];
            self.date = [coder decodeObjectForKey:@"date"];
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
    [aCoder encodeObject:self.date forKey:@"date"];
}

@end