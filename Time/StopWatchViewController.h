//
//  StopWatchViewController.h
//  Time
//
//  Created by Matthew Man on 3/3/2017.
//  Copyright © 2017年 MatthewApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StopWatchViewController : UIViewController
{
    NSTimer *_timer;
    NSTimeInterval startTime;
    NSTimeInterval storedTime;
}

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
- (IBAction)stopWatchStart:(id)sender;
- (IBAction)stopWatchStop:(id)sender;
- (IBAction)resetAction:(id)sender;

@end
