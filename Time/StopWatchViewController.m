//
//  StopWatchViewController.m
//  Time
//
//  Created by Matthew Man on 3/3/2017.
//  Copyright © 2017年 MatthewApp. All rights reserved.
//

#import "StopWatchViewController.h"

@interface StopWatchViewController ()

@end

@implementation StopWatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    storedTime = 0.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) updateTime:(NSTimer*)timer
{
    NSTimeInterval time = [NSDate timeIntervalSinceReferenceDate] - startTime + storedTime;
    int sec = time;
    int msec = (time-sec) * 100;
    self.timeLabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d",sec/60,sec%60,msec];
}

- (IBAction)stopWatchStart:(id)sender
{
    startTime = [NSDate timeIntervalSinceReferenceDate];
    if([self.timeLabel.text isEqualToString: @"00:00:00"]){
        self.timeLabel.text = @"00:00:00";
    }
    if(_timer && [_timer isValid])
    {
        [_timer invalidate];
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
}

- (IBAction)stopWatchStop:(id)sender {
    [_timer invalidate];
    _timer = nil;
    NSTimeInterval time = [NSDate timeIntervalSinceReferenceDate] - startTime + storedTime;
    storedTime = time;
}

- (IBAction)resetAction:(id)sender
{
    self.timeLabel.text = @"00:00:00";
    storedTime = 0.0;
}

@end
