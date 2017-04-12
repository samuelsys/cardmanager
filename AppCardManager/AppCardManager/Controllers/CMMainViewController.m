//
//  CMMainViewController.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 11/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMMainViewController.h"
#import "SWRevealViewController.h"
#import "CMCard.h"
#import "CMSingletonUser.h"
#import "CMMainView.h"
#import "CMCardManager.h"

@interface CMMainViewController ()

@property (weak, nonatomic, readonly) CMMainView *mainView;

@property (strong, nonatomic) CMCardManager *manager;

@end

@implementation CMMainViewController

- (CMCardManager *)manager {
    if (!_manager){
        _manager = [CMCardManager new];
    }
    return _manager;
}

- (CMMainView *)mainView {
    return (CMMainView *) self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.manager defineCardToShow:^(CMCard *cardToShow) {
        
        
        [self.mainView setup:cardToShow];
        
    }];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController ){
        [self.barButton setTarget: self.revealViewController];
        [self.barButton setAction: @selector( revealToggle: )];
        self.revealViewController.rearViewRevealWidth = self.view.frame.size.width-50;
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

-(void) viewDidAppear:(BOOL)animated{
    
    
    
    
    [super viewDidAppear:YES];
    
}

@end
