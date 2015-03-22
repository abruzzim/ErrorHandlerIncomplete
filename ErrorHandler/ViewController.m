//
//  ViewController.m
//  ErrorHandler
//
//  Created by Mario Abruzzi on 3/21/15.
//  Copyright (c) 2015 FWS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fakeNonFatalError:(id)sender {
    
    // Create a fake error with a single recovery option.
    
    NSString *description        = @"Connection Error";
    NSString *failureReason      = @"Unable to connect to the network.";
    NSArray  *recoveryOptions    = @[@"Retry"];
    NSString *recoverySuggestion = @"Verify Wi-Fi setting and retry.";
    
    NSDictionary *userInfo =
    [NSDictionary dictionaryWithObjects:@[description, failureReason, recoveryOptions, recoverySuggestion, self]
                                forKeys:@[NSLocalizedDescriptionKey, NSLocalizedFailureReasonErrorKey, NSLocalizedRecoveryOptionsErrorKey, NSLocalizedRecoverySuggestionErrorKey, NSRecoveryAttempterErrorKey]];
    
    NSError *errorObj = [[NSError alloc] initWithDomain:@"ViewController" code:42 userInfo:userInfo];
    
    [ErrorHandler handleError:errorObj fatal:NO];
    
}

- (IBAction)fakeFatalError:(id)sender {
    
    NSString *description        = @"Data Error";
    NSString *failureReason      = @"Data is inconsistent. The app will shut down.";
    NSString *recoverySuggestion = @"Contact support.";
    
    NSDictionary *userInfo =
    [NSDictionary dictionaryWithObjects:@[description, failureReason, recoverySuggestion]
                                forKeys:@[NSLocalizedDescriptionKey, NSLocalizedFailureReasonErrorKey, NSLocalizedRecoverySuggestionErrorKey]];
    
    NSError *errorObj = [[NSError alloc] initWithDomain:@"ViewController" code:22 userInfo:userInfo];
    
    [ErrorHandler handleError:errorObj fatal:YES];
    
}

- (BOOL)attemptRecoveryFromError:(NSError *)errorObj optionIndex:(NSUInteger)recoveryOptionIndex {
    
    return NO;
    
}

@end
