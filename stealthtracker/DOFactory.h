//
//  DOFactory.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 08/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SkirmDO.h"

@interface DOFactory : NSObject

+(SkirmDO *)createObjectFromDict:(NSDictionary *)dict;

@end
