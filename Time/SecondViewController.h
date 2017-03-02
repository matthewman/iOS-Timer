//
//  SecondViewController.h
//  Time
//
//  Created by Matthew Man on 2/3/2017.
//  Copyright © 2017年 MatthewApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
{
    NSTimeInterval startTime;
}

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
- (IBAction)timeStart:(id)sender;

@end

