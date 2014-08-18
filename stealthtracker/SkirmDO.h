//
//  SkirmDO.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 08/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SkirmDO : NSObject<NSCoding>

@property (nonatomic) int userId;
@property (nonatomic) int time;
@property (nonatomic, strong) NSMutableArray *arrDB;
@property (nonatomic, strong) NSMutableArray *arrLux;
@property (nonatomic) int kills;
@property (nonatomic) int deaths;
@property (nonatomic) int result;

@end
