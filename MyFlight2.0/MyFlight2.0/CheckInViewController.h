//
//  CheckInViewController.h
//  MyFlight2.0
//
//  Created by apple on 12-12-26.
//  Copyright (c) 2012年 LIAN YOU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ChooseAirPortViewController.h"
#import "ChooseFlightViewController.h"
#import "AirPortData.h"

@interface CheckInViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ChooseAirPortViewControllerDelegate, UIActionSheetDelegate>
{
    UITableView *checkInInfoTable;
    
    IBOutlet UIButton *registerforCheckIn;
    IBOutlet UIButton *checkforProgress;
    
    NSArray *titleArray;
    
    NSString *passName;
    NSString *idNo;
    NSString *depCity;
    NSString *depCityCode;
    
    unsigned char passportType;
    
    UITextField *textInput;
    
    __block NSDictionary *responseDictionary;
}

- (void) back;
- (void) userDidInput;
- (void) userCancelInput;

- (void) checkIn;
- (void) progressQuery;

@end