//
//  SecondViewController.h
//  Time
//
//  Created by Matthew Man on 2/3/2017.
//  Copyright © 2017年 MatthewApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UITextFieldDelegate>
{
    NSTimeInterval startTime;
}

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
- (IBAction)timeStart:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UITextField *inputTime;
- (IBAction)endEditing:(id)sender;

@end

