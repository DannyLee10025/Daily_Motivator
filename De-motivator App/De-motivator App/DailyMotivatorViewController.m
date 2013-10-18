//
//  DailyMotivatorViewController.m
//  De-motivator App
//
//  Created by Danny Lee on 8/26/13.
//  Copyright (c) 2013 Danny Lee. All rights reserved.
//

#import "DailyMotivatorViewController.h"

@interface DailyMotivatorViewController ()

@end

@implementation DailyMotivatorViewController

@synthesize emailPicker=emailPicker_;

- (void)viewDidLoad
{
    [super viewDidLoad];
	description1_ = [[NSArray alloc] initWithObjects:@"a great", @"a lazy", @"a fantastic", @"a smart", @"a slow thinking", @"a confident", @"an enabling", @"an arrogant", nil];
    description2_ = [[NSArray alloc] initWithObjects:@"charming", @"needy", @"fortunate", @"lousy", @"caring", @"loving",@"misunderstood", @"complex", nil];
}

#pragma  mark -
#pragma mark Picker Datasource Protocol

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;   //number of components
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [description1_ count];
    }
    else {
        return [description2_ count];
    }
}

#pragma mark - 
#pragma mark Picker Delegate Protocol

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [description1_ objectAtIndex:row];
    }
    else {
        return [description2_ objectAtIndex:row];
    }
    return nil;
}

#pragma mark-
#pragma mark Actions

- (IBAction)sendButtonTapped:(id)sender {
    NSString* theMessage = [NSString stringWithFormat:@"You are %@ and %@ individual today.",
        [description1_ objectAtIndex:[emailPicker_ selectedRowInComponent:0]],
                            [description2_ objectAtIndex:[emailPicker_ selectedRowInComponent:1]]];
    NSLog(@"%@" ,theMessage);
    
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController* mailController = [[MFMailComposeViewController alloc] init];
        mailController.mailComposeDelegate = self;
        [mailController setSubject:@"Today's Daily Motivater/De-motivator"];
        [mailController setMessageBody:theMessage isHTML:NO];
        [self presentModalViewController:mailController animated:YES];
    }
    else {
        NSLog(@"%@", @"Sorry, you need to setup mail first.");
    }
    //NSLog(@"Email button has been tapped.");
}

#pragma mark -
#pragma mark Mail composer delegate method

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error;
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
