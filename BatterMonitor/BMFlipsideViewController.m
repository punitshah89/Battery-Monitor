//
//  BMFlipsideViewController.m
//  BatterMonitor
//
//  Created by Digital 02 on 2/5/2014.
//  Copyright (c) 2014 Digital 02. All rights reserved.
//

#import "BMFlipsideViewController.h"
#import "BMAppDelegate.h"

@interface BMFlipsideViewController ()

@end

@implementation BMFlipsideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"Preferences";
    BMAppDelegate *appDelegate= (BMAppDelegate *) [[UIApplication sharedApplication] delegate];
    self.toggleSwitch.on = appDelegate.monitorBattery;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
    BMAppDelegate *appDelegate= (BMAppDelegate *) [[UIApplication sharedApplication] delegate];
    appDelegate.monitorBattery=self.toggleSwitch.on;

}

@end
