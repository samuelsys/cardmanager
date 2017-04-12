//
//  CMMainView.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 12/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMMainView.h"

@interface CMMainView ()

@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;
@property (weak, nonatomic) IBOutlet UILabel *expireDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *limitValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *billValueLabel;

@end

@implementation CMMainView

-(void) setup:(CMCard *)currentCard{
    if (currentCard){
        
        NSDictionary *imageColors = @{@"purple":@"imgCartaoRoxo",
                                      @"red":@"imgCartaoVermelho",
                                      @"green":@"imgCartaoVerde"};
        
        self.cardImageView.image = [UIImage imageNamed:[imageColors objectForKey:currentCard.colorCard]];;
        self.expireDateLabel.text = currentCard.dueDate;
        self.limitValueLabel.text = currentCard.limitAvailable;
        self.billValueLabel.text = currentCard.invoiceAmount;
    }
}

@end
