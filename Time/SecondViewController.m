//
//  SecondViewController.m
//  Time
//
//  Created by Matthew Man on 2/3/2017.
//  Copyright © 2017年 MatthewApp. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateTime:(NSTimer*)timer
{
    NSTimeInterval time = [NSDate timeIntervalSinceReferenceDate] - startTime;
    
    int timeLeft = ceil(5.0 * 3.0 - time);
    
    self.timeLabel.text = [NSString stringWithFormat:@"%02d:%02d",timeLeft/60, timeLeft%60];
    
    if(timeLeft<=0)
    {
        [timer invalidate];
        
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Timer"
                                     message:nil
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"OK action");
                                   }];
        
        [alert addAction:okAction];
    }
}

- (IBAction)timeStart:(id)sender {
    startTime = [NSDate timeIntervalSinceReferenceDate];
    self.timeLabel.text = @"00:15";
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
}
@end
