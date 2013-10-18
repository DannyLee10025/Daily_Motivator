//
//  DailyMotivatorViewController.h
//  De-motivator App
//
//  Created by Danny Lee on 8/26/13.
//  Copyright (c) 2013 Danny Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface DailyMotivatorViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate, MFMailComposeViewControllerDelegate> {
    NSArray* description1_;
    NSArray* description2_;
    
}
@property (nonatomic, retain) IBOutlet UIPickerView *emailPicker;

- (IBAction)sendButtonTapped:(id)sender;



@end
