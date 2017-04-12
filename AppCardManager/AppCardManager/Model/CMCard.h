//
//  CMCard.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 06/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

@import Foundation;
#import "CMExtract.h"

@interface CMCard : NSObject

@property (nonatomic) NSInteger cardNumber;
@property (strong, nonatomic) NSString *imageFlag;
@property (strong, nonatomic) NSString *imageCard;
@property (strong, nonatomic) NSString *colorCard;
@property (strong, nonatomic) NSString *dueDate;
@property (strong, nonatomic) NSString *limitAvailable;
@property (strong, nonatomic) NSString *invoiceAmount;
@property (strong, nonatomic) NSMutableArray *extractMutableArray;

/**
 *  instantiate Card with a Dictionary Map
 *
 *  @param cardsDictionary
 *
 *  @return A Card Object
 */

-(CMCard*) initWithDictionary:(NSDictionary*) cardsDictionary;

/**
 *  search a card number into an array of cards
 *
 *  @param cardNumber
 *  @param cardsMutableArray
 *
 *  @return the card object found or nil
 */

+ (CMCard *)getCardInMutableArray:(NSInteger)cardNumber searchInMutableArray:(NSMutableArray *)cardsMutableArray;

@end
