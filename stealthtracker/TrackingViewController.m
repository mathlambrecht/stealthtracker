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
        [self createLuxMeter];
        
        [self.view.btnPause addTarget:self action:@selector(btnPauseClickedHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.view.btnResume addTarget:self action:@selector(btnResumeClickedHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.view.btnEnd addTarget:self action:@selector(btnEndClickedHandler:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view.btnKill addTarget:self action:@selector(btnKillCickedHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.view.btnDeath addTarget:self action:@selector(btnDeathClickedHandler:) forControlEvents:UIControlEventTouchUpInside];
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

-(void)createLuxMeter{}

// ---------------------------------------- TickHandler ----------------------------------------
-(void)timerTickHandler
{
    [self.recorder updateMeters];
    
    [self.arrDB addObject:[NSNumber numberWithFloat:[self.recorder averagePowerForChannel:0]]];
    self.view.decibelHUD.dB = [self.recorder averagePowerForChannel:0];
    
    self.appModel.time += 1;
    self.view.seconds = self.appModel.time;
}

-(void)btnPauseClickedHandler:(id)sender
{
    //disable HUD
    
    //stop time
    [self.timer invalidate];
    self.timer = nil;
    
    //show options to continue / end tracking
    self.isPaused = !self.isPaused;
    [self.view showOptions:self.isPaused];
}

-(void)btnResumeClickedHandler:(id)sender
{
    self.isPaused = !self.isPaused;
    [self.view showOptions:self.isPaused];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTickHandler) userInfo:nil repeats:YES];
}

-(void)btnEndClickedHandler:(id)sender
{
}

-(void)btnKillCickedHandler:(id)sender
{
    self.appModel.kills += 1;
}

-(void)btnDeathClickedHandler:(id)sender
{
    self.appModel.deaths += 1;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Navbar Appearance
    [self.navigationController setNavigationBarHidden:YES];
    
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[TrackingView alloc] initWithFrame:bounds];
    
    self.arrDB = [[NSMutableArray alloc] init];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTickHandler) userInfo:nil repeats:YES];
    
    self.isPaused = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
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
