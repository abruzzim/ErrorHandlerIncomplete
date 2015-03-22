//
//  ErrorHandler.m
//  ErrorHandler
//
//  Created by Mario Abruzzi on 3/21/15.
//  Copyright (c) 2015 FWS. All rights reserved.
//

#import "ErrorHandler.h"

@implementation ErrorHandler

static NSMutableArray *retainedDelegates = nil;

- (id) initWithError:(NSError *)errorObj fatal:(BOOL)fatalError {
    
    self = [super init];
    if (self) {
        self.errorObj   = errorObj;
        self.fatalError = &(fatalError);
    }
    return self;
    
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex != [alertView cancelButtonIndex]) {
        
        // Cancel button not tapped.
        
        NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
        NSInteger recoveryIndex = [[self.errorObj localizedRecoveryOptions] indexOfObject:buttonTitle];
        
        if (recoveryIndex != NSNotFound) {
            
            if ([[self.errorObj recoveryAttempter] attemptRecoveryFromError:self.errorObj optionIndex:recoveryIndex] == NO) {
                
                // Redisplay alert since recovery attempt failed.
                [ErrorHandler handleError:self.errorObj fatal:self.fatalError];
            }
        }
        
    } else {
        
        // Cancel button tapped.
        
        if (self.fatalError) {
            
            abort();
        }
    }
    
    // Release this delegate.
    
    [retainedDelegates removeObject:self];
    
}

+ (void) handleError:(NSError *)errorObj fatal:(BOOL)fatalError {
    
    NSString *localizedCancelTitle = NSLocalizedString(@"Dismiss", nil);
    if (fatalError) localizedCancelTitle = NSLocalizedString(@"Shutdown", nil);
    
    // Notify the user.
    
    
    
}

@end
