//
//  ViewController.h
//  ErrorHandler
//
//  Created by Mario Abruzzi on 3/21/15.
//  Copyright (c) 2015 FWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ErrorHandler.h"

@interface ViewController : UIViewController

- (IBAction)fakeNonFatalError:(id)sender;
- (IBAction)fakeFatalError:(id)sender;

@end

