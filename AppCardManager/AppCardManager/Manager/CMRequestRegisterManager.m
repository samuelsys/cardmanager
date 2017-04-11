//
//  CMRequestRegisterManager.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 10/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMRequestRegisterManager.h"
#import "CMUserBO.h"

@interface CMRequestRegisterManager ()
    @property (strong, nonatomic) NSOperationQueue *mainQueue;
@end

@implementation CMRequestRegisterManager

-(NSOperationQueue *)mainQueue {
    if (!_mainQueue){
        _mainQueue = [NSOperationQueue new];
    }
    return _mainQueue;
}

- (void) newUserRequestRegister:(NSString *)userName
                          email:(NSString *)email
                       celphone:(NSString *)celphone
                     cardNumber:(NSString *)cardNumber
            withCompletionBlock:(SignupResultBlock)completionBlock{
    [self.mainQueue addOperationWithBlock:^{
        
        [CMUserBO newUserRequestRegister:userName email:email celphone:celphone
                              cardNumber:cardNumber success:^(NSString *message){
                                  completionBlock(YES, message);
        } failure:^(NSError *error, NSString *message) {
            completionBlock(NO, message);
        }];
    }];
}



@end
