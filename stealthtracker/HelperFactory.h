//
//  HelperFactory.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 01/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppModel.h"

@interface HelperFactory : NSObject

+(NSMutableAttributedString *)createAttributedString:(NSString *)string;
+(NSMutableAttributedString *)createAttributedHighlightString:(NSString *)string;
+(UILabel *)createNavbarTitle:(NSString *)string;
+(NSString *)getArchivePath;
+(float)calculateAverageDb;
+(float)calculateAverageLux;
+(int)calculateTotalKills;
+(int)calculateTotalDeaths;
+(float)calculateAverageDBBySkirm;
+(float)calculateAverageLuxBySkirm;

@end
