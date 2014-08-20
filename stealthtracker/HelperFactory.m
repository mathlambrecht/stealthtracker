//
//  HelperFactory.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 01/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "HelperFactory.h"

@implementation HelperFactory

+(NSMutableAttributedString *)createAttributedString:(NSString *)string
{
    string = [string uppercaseString];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttribute:NSKernAttributeName value:@(2) range:NSMakeRange(0, [string length])];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.73 green:0.8 blue:0.82 alpha:1] range:NSMakeRange(0, [string length])];
    
    return attributedString;
}

+(NSMutableAttributedString *)createAttributedHighlightString:(NSString *)string
{
    string = [string uppercaseString];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttribute:NSKernAttributeName value:@(2) range:NSMakeRange(0, [string length])];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.73 green:0.8 blue:0.82 alpha:0.5] range:NSMakeRange(0, [string length])];
    
    return attributedString;
}

+(UILabel *)createNavbarTitle:(NSString *)string
{
    UILabel *lbl = [UILabel new];
    lbl.attributedText = [self createAttributedString:string];
    lbl.textColor = [UIColor colorWithRed:0.73 green:0.8 blue:0.82 alpha:1];
    lbl.font = [UIFont fontWithName:@"RODUScut300" size:16];
    [lbl sizeToFit];
    return lbl;
}

+(NSString *)getArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:@"stealthtracker.archive"];
}

+(float)calculateAverageDb
{
    float total = 0.0;
    int count = 0;
    
    for(SkirmDO *skirmDO in [[AppModel getInstance] arrSkirms])
    {
        for(NSNumber *number in skirmDO.arrDB)
        {
            total = total + [number floatValue];
        }
        
        count = count + [skirmDO.arrDB count];
    }
    
    return total/count;
}

+(float)calculateAverageLux
{
    float total = 0;
    int count = 0;
    
    for(SkirmDO *skirmDO in [[AppModel getInstance] arrSkirms])
    {
        for(NSNumber *number in skirmDO.arrLux)
        {
            total = total + [number floatValue];
        }
        
        count = count + [skirmDO.arrLux count];
    }
    
    return (total/count) * 1000;
}

+(float)calculateAverageDBBySkirm
{
    float total = 0;
    
    for(NSNumber *number in [[AppModel getInstance] arrDB])
    {
        total = total + [number floatValue];
    }
    
    return total/[[[AppModel getInstance] arrDB] count];
}

+(float)calculateAverageLuxBySkirm
{
    float total = 0;
    
    for(NSNumber *number in [[AppModel getInstance] arrLux])
    {
        total = total + [number floatValue];
    }
    
    return total/[[[AppModel getInstance] arrLux] count];
}

+(int)calculateTotalKills
{
    int kills = 0;
    
    for(SkirmDO *skirmDO in [[AppModel getInstance] arrSkirms])
    {
        kills = kills + skirmDO.kills;
    }
    
    return kills;
}

+(int)calculateTotalDeaths
{
    int deaths = 0;
    
    for(SkirmDO *skirmDO in [[AppModel getInstance] arrSkirms])
    {
        deaths = deaths + skirmDO.deaths;
    }
    
    return deaths;
}

@end
