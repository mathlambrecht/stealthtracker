//
//  DatabaseService.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 07/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "DOFactory.h"
#import "SkirmDO.h"
#import "HelperFactory.h"

@interface DatabaseService : NSObject

@property(strong, nonatomic) __block NSMutableArray *arrSkirms;

-(void)getSkirmsByUserId:(NSString *)userId;
-(void)saveSession;

@end
