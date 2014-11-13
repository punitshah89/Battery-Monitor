//
//  BMMainViewController.m
//  BatterMonitor
//
//  Created by Digital 02 on 2/5/2014.
//  Copyright (c) 2014 Digital 02. All rights reserved.
//

#import "BMMainViewController.h"
#import "BMAppDelegate.h"

@interface BMMainViewController ()


@end

@implementation BMMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(BMFlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
     [super viewWillAppear:animated];
    UIDevice *device = [UIDevice currentDevice];
    BMAppDelegate *appDelegate =
    (BMAppDelegate *) [[UIApplication sharedApplication] delegate];
    device.batteryMonitoringEnabled = appDelegate.monitorBattery;
    if (device.batteryMonitoringEnabled) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(batteryChanged:)
                                                     name:@"UIDeviceBatteryLevelDidChangeNotification" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(batteryChanged:)
                                                     name:@"UIDeviceBatteryStateDidChangeNotification" object:nil];
    } else {
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:@"UIDeviceBatteryLevelDidChangeNotification" object:nil];
    }
    _levelLabel.text=[self batteryLevel];
    _stateLabel.text=[self batteryState:device.batteryState];
    
  
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(NSString *)batteryLevel{
    UIDevice *device=[UIDevice currentDevice];
    NSString *levelString=nil;
    float level = device.batteryLevel;
    if(level == -1)
        levelString = @"---%";
    else{
        int percent=(int) (level * 100);
        levelString = [NSString stringWithFormat:@"%i%%",percent];
    }
    return levelString;
}

-(void)batteryChanged:(NSNotification *)note{
    UIDevice *device=[UIDevice currentDevice];
    self.levelLabel.text=[self batteryLevel];
    self.stateLabel.text=[self batteryState:device.batteryState];
}

-(NSString *)batteryState:(UIDeviceBatteryState)batteryState{
    NSString *state=nil;
    switch (batteryState) {
        case UIDeviceBatteryStateUnknown:
            state=@"Unknown";
            break;
        case UIDeviceBatteryStateUnplugged:
            state=@"Unplugged";
            break;
        case UIDeviceBatteryStateCharging:
            state=@"Charging";
            break;
        case UIDeviceBatteryStateFull:
            state=@"Full";
            break;
            
        default:
            break;
    }
    return state;
}
@end
