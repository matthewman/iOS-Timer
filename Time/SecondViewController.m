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
    self.inputTime.delegate = self;
    self.startButton.enabled = NO;
    
    //recognise tap to exit keyboard
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateTime:(NSTimer*)timer
{
    NSTimeInterval time = [NSDate timeIntervalSinceReferenceDate] - startTime;
    
    int timeLeft = ceil([self.inputTime.text floatValue] - time);
    
    self.timeLabel.text = [NSString stringWithFormat:@"%02d:%02d",timeLeft/60, timeLeft%60];
    
    if(timeLeft<=0)
    {
        [timer invalidate];
        
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Timer"
                                     message:self.inputTime.text
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {}];
        
        
        
        [alert addAction:okAction];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
        self.inputTime.enabled = YES;
    }
}

- (IBAction)timeStart:(id)sender
{
    self.inputTime.enabled = NO;
    startTime = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval time = [NSDate timeIntervalSinceReferenceDate] - startTime;
    int timeLeft = ceil([self.inputTime.text floatValue] - time);
    self.timeLabel.text = [NSString stringWithFormat:@"%02d:%02d",timeLeft/60, timeLeft%60];;
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
}

-(void)dismissKeyboard
{
    [self.inputTime resignFirstResponder];
}



- (IBAction)endEditing:(id)sender
{
    if(self.inputTime.text.length == 0)
    {
        self.startButton.enabled = NO;
    }
    else
    {
        self.startButton.enabled = YES;
    }
}
@end
