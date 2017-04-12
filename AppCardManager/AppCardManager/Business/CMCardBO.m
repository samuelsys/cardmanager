//
//  CMCardBO.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 12/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMCardBO.h"
#import "CMCard.h"
#import "CMSingletonUser.h"
#import "CMUserDefaultsProvider.h"

@implementation CMCardBO

+ (void)defineCardToShow:(CardBlock)completion {
    NSInteger lastCardSelected = [[CMUserDefaultsProvider sharedInstance] getCardNumberOnUserDefaults];
    
    NSMutableArray *userCards = CMSingletonUser.sharedInstance.loggedUser.cardMutableArray;
    
    if (userCards.count > 0){
        if (lastCardSelected){
            CMCard *card = [CMCard getCardInMutableArray:lastCardSelected searchInMutableArray: userCards];
            completion(card);
        }
        completion(userCards[0]);
    }
    completion(nil);
}







@end
