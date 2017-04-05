//
//  Validators.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 04/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "Validators.h"

@implementation Validators

static NSString* const ACMEmailPatternRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";

+ (instancetype) sharedInstance
{
    static Validators *sharedInstance = nil;
    
    if (!sharedInstance){
        sharedInstance = [[Validators alloc] init];
    }
    return sharedInstance;
}

- (BOOL) isEmailValid:(NSString*) email {
    
    NSString *regExPattern = ACMEmailPatternRegex;

    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSUInteger regExMatches = [regEx numberOfMatchesInString:email options:0 range:NSMakeRange(0, [email length])];

    return regExMatches ? YES : NO;
    
}



@end
