//
//  CMUser.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 06/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMUser.h"
#import "CMExtract.h"
#import "CMCard.h"

@implementation CMUser

-(CMUser*) initWIthLoginResponse:(id)loginResponse{
    
    CMUser *userReturn = [CMUser new];
    
    if ([loginResponse isKindOfClass:[NSDictionary class]]){
        
        NSDictionary *loginResponseDictionary = (NSDictionary*)loginResponse;
        
        NSDictionary *userDictionary = [loginResponseDictionary objectForKey:@"user"];
        
        userReturn.name = [userDictionary objectForKey:@"name"];
        userReturn.imageProfile = [userDictionary objectForKey:@"image_profile"];
        
        NSMutableArray *cards = [loginResponseDictionary mutableArrayValueForKey:@"cards"];
        
        if (cards){
            for (int x=0; x < [cards count]; x++){
                CMCard *card = [[CMCard alloc] initWithDictionary:cards[x]];
                [userReturn.cardMutableArray addObject:card];
            }
        }
    }
    return userReturn;
}
@end
