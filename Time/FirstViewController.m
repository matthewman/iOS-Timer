//
//  FirstViewController.m
//  Time
//
//  Created by Matthew Man on 2/3/2017.
//  Copyright © 2017年 MatthewApp. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)updateTime:(NSTimer*)timer
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    NSDate *now = [NSDate date];
    [formatter setDateFormat:@"HH:mm:ss"];
    
    self.timeLabel.text = [formatter stringFromDate:now];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
