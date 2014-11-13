//
//  BMFlipsideViewController.h
//  BatterMonitor
//
//  Created by Digital 02 on 2/5/2014.
//  Copyright (c) 2014 Digital 02. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BMFlipsideViewController;

@protocol BMFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(BMFlipsideViewController *)controller;
@end

@interface BMFlipsideViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;

@property (weak, nonatomic) id <BMFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
