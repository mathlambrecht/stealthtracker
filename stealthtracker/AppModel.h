//
//  AppModel.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 01/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DatabaseService.h"

@interface AppModel : NSObject

@property (nonatomic, readwrite) BOOL isLoggedIn;
@property (nonatomic, readwrite, strong) NSDictionary *dUser;
@property (nonatomic, readwrite, strong) NSArray *arrSkirms;

@property (nonatomic, readwrite) int time;
@property (nonatomic, readwrite, strong) NSArray *arrDB;
@property (nonatomic, readwrite, strong) NSArray *arrLux;
@property (nonatomic, readwrite) int kills;
@property (nonatomic, readwrite) int deaths;

+ (id)getInstance;

@end
