//
//  CMRequestRegisterManager.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 10/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SignupResultBlock) (BOOL, NSString *);

@interface CMRequestRegisterManager : NSObject

- (void) newUserRequestRegister:(NSString *)userName
                          email:(NSString *)email
                       celphone:(NSString *)celphone
                     cardNumber:(NSString *)cardNumber
            withCompletionBlock:(SignupResultBlock)completionBlock;

@end
