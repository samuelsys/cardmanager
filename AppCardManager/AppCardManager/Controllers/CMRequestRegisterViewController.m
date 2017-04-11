//
//  CMRequestRegisterViewController.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 09/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMRequestRegisterViewController.h"
#import "CMRequestRegisterView.h"
#import "CMRequestRegisterManager.h"

@interface CMRequestRegisterViewController ()

@property (strong, nonatomic) CMRequestRegisterView *requestRegisterLoginView;

@property (weak, nonatomic) IBOutlet CardIOView *cardIOView;

@property (strong, nonatomic) CMRequestRegisterManager *manager;

@end

@implementation CMRequestRegisterViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    if (![CardIOUtilities canReadCardWithCamera]) {
        // Hide your "Scan Card" button, remove the CardIOView from your view, and/or take other appropriate action...
        
    } else {
        self.cardIOView.delegate = self;
    }
    
    [self.requestRegisterLoginView setupWithController:self];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [CardIOUtilities preloadCardIO];
}

- (CMRequestRegisterManager *) manager {
    if (!_manager){
        _manager = [CMRequestRegisterManager new];
    }
    return _manager;
}

- (CMRequestRegisterView *)requestRegisterLoginView{
    return (CMRequestRegisterView *) self.view;
}

- (IBAction)cardReadAction:(id)sender {
    self.cardIOView.alpha = [CardIOUtilities canReadCardWithCamera] ? 1.0 : 0.0;
}

- (void)cardIOView:(CardIOView *)cardIOView didScanCard:(CardIOCreditCardInfo *)info {
    if (info) {
        // The full card number is available as info.cardNumber, but don't log that!
        NSLog(@"Received card info. Number: %@, expiry: %02lu/%lu, cvv: %@.", info.redactedCardNumber, (unsigned long)info.expiryMonth, (unsigned long)info.expiryYear, info.cvv);
        // Use the card info...
    } else {
        NSLog(@"User canceled payment info");
        // Handle user cancellation here...
    }
    
    self.cardIOView.alpha = 1.0;
}

- (IBAction)requestRegisterAction:(id)sender {
    if ([self.requestRegisterLoginView isRegisterFormValid]){
        
        NSString *userName = self.requestRegisterLoginView.userName;
        NSString *email = self.requestRegisterLoginView.email;
        NSString *celPhone = self.requestRegisterLoginView.celPhone;
        NSString *cardNumber = self.requestRegisterLoginView.cardNumber;

        [self.manager newUserRequestRegister:userName
                                       email:email
                                    celphone:celPhone
                                  cardNumber:cardNumber
                         withCompletionBlock:^(BOOL status, NSString *message) {
            
                             if (status){
                                 [self.requestRegisterLoginView requestSentWithSuccess];
                             }else{
                                 [self.requestRegisterLoginView requestFailure];
                             }
                             
        }];
    }
}

@end
