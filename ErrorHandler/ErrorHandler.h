//
//  ErrorHandler.h
//  ErrorHandler
//
//  Created by Mario Abruzzi on 3/21/15.
//  Copyright (c) 2015 FWS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ErrorHandler : NSObject

@property (strong, nonatomic) NSError *errorObj;
@property         (nonatomic) BOOL    *fatalError;

- (id) initWithError:(NSError *)errorObj fatal:(BOOL)fatalError;

+ (void) handleError:(NSError *)errorObj fatal:(BOOL)fatalError;

@end
