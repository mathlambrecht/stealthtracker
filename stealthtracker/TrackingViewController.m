//
//  TrackingViewController.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 07/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "TrackingViewController.h"

@interface TrackingViewController ()

@end

@implementation TrackingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        self.appModel = [AppModel getInstance];
        
        [self createDecibelMeter];
    }
    return self;
}

-(void)createDecibelMeter
{
    NSDictionary *recorderSettings = [NSDictionary dictionaryWithObjectsAndKeys:
                                      [NSNumber numberWithInt:kAudioFormatAppleIMA4], AVFormatIDKey,
                                      [NSNumber numberWithInt:44100], AVSampleRateKey,
                                      [NSNumber numberWithInt:1], AVNumberOfChannelsKey,
                                      [NSNumber numberWithInt:16], AVLinearPCMBitDepthKey,
                                      [NSNumber numberWithBool:NO], AVLinearPCMIsBigEndianKey,
                                      [NSNumber numberWithBool:NO], AVLinearPCMIsFloatKey,
                                      nil];
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [audioSession setActive:YES error:nil];
    
    [audioSession requestRecordPermission:^(BOOL granted)
    {
        if(granted)
        {
            NSError *e = nil;
            self.recorder = [[AVAudioRecorder alloc] initWithURL:[NSURL URLWithString:[NSTemporaryDirectory() stringByAppendingPathComponent:@"tmp.caf"]] settings:recorderSettings error:&e];
            [self.recorder prepareToRecord];
            self.recorder.meteringEnabled = YES;
            [self.recorder record];
        }
        else
        {
            NSLog(@"[TrackingVC] Microphone use not allowed by user");
        }
    }];
}

-(void)createLuxMeter
{
    
}

-(void)timerTickHandler
{
    [self.recorder updateMeters];
    
    [self.arrDB addObject:[NSNumber numberWithFloat:[self.recorder averagePowerForChannel:0]]];
    self.view.decibelHUD.dB = [self.recorder averagePowerForChannel:0];
    
    self.view.seconds += 1;
}

-(void)btnPauseClickedHandler:(id)sender
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Navbar Appearance
    [self.navigationController setNavigationBarHidden:YES];
    
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[TrackingView alloc] initWithFrame:bounds];
    
    [self.view.btnPause addTarget:self action:@selector(btnPauseClickedHandler:) forControlEvents:UIControlEventTouchUpInside];
    
    self.arrDB = [[NSMutableArray alloc] init];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTickHandler) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
