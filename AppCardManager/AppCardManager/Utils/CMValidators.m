//
//  CMValidators.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 04/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMValidators.h"
#import "Reachability.h"

@implementation CMValidators

static NSString* const ACMEmailPatternRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";

+ (BOOL) isEmailValid:(NSString*)email {
    
    NSString *regExPattern = ACMEmailPatternRegex;
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSUInteger regExMatches = [regEx numberOfMatchesInString:email
                                                     options:0
                                                       range:NSMakeRange(0, [email length])];

    return regExMatches ? YES : NO;
}

+ (BOOL)isConnectionOffline {
    return [[Reachability reachabilityForInternetConnection]currentReachabilityStatus]==NotReachable;
}

+ (BOOL)isNumeric:(NSString *)newCharacter{
    unichar c = [newCharacter characterAtIndex:0];
    NSCharacterSet *numericSet = [NSCharacterSet decimalDigitCharacterSet];
    return [numericSet characterIsMember:c];
}

+ (BOOL)hasMinimum3Characters:(NSString *)text{
    return text.length >= 3;
}

+ (BOOL)isCelPhoneValid:(NSString *)celPhone{
    NSCharacterSet *nonDigitCharacterSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSString *onlyNumbers = [[celPhone componentsSeparatedByCharactersInSet:nonDigitCharacterSet]
                             componentsJoinedByString:@""];
    return onlyNumbers.length == 11;
}

@end
