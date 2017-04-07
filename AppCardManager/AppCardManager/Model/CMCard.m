//
//  CMCard.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 06/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMCard.h"
#import "CMExtract.h"

@implementation CMCard

-(CMCard*) initWithDictionary:(NSDictionary*)cardsDictionary {
    
    CMCard *card = [CMCard new];
    
    NSString *cardNumberString = [cardsDictionary objectForKey:@"card_number"] ;
    
    card.cardNumber = [cardNumberString integerValue];
    card.imageFlag = [cardsDictionary objectForKey:@"image_flag"];
    card.imageCard = [cardsDictionary objectForKey:@"image_card"];
    card.colorCard = [cardsDictionary objectForKey:@"color_card"];
    card.dueDate = [cardsDictionary objectForKey:@"due_date"];
    card.limitAvailable = [cardsDictionary objectForKey:@"limit_available"];
    card.invoiceAmount = [cardsDictionary objectForKey:@"invoice_amount"];
    
    NSMutableArray *extractMutableArray = [cardsDictionary mutableArrayValueForKey:@"extract"];
    
    for (int x=0;x < [extractMutableArray count] ; x++){
        CMExtract *extract = [[CMExtract alloc] initWithDictionary:extractMutableArray[x]];
        [card.extractMutableArray addObject:extract];
    }

    return card;
}



@end
