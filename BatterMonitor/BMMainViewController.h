//
//  BMMainViewController.h
//  BatterMonitor
//
//  Created by Digital 02 on 2/5/2014.
//  Copyright (c) 2014 Digital 02. All rights reserved.
//

#import "BMFlipsideViewController.h"
#import "BMAppDelegate.h"

@interface BMMainViewController : UIViewController <BMFlipsideViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
-(void)batteryChanged:(NSNotification *)note;
-(NSString *)batteryLevel;
-(NSString *)batteryState:(UIDeviceBatteryState)batteryState;

@end
