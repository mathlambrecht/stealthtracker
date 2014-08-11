//
//  TrackingViewController.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 07/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVAudioSession.h>
#import "AppModel.h"
#import "TrackingView.h"

@interface TrackingViewController : UIViewController

@property(strong, nonatomic) AppModel *appModel;
@property(strong, nonatomic) TrackingView *view;

@property(strong, nonatomic) AVAudioRecorder *recorder;
@property(strong, nonatomic) NSMutableArray *arrDB;
@property(strong, nonatomic) NSMutableArray *arrLux;

@end
