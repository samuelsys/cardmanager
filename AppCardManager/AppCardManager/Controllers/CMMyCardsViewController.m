//
//  CMMyCardsViewController.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 13/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMMyCardsViewController.h"
#import "CMSingletonUser.h"
#import "CMCard.h"
#import "SWRevealViewController.h"

@interface CMMyCardsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CMMyCardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController ){
        [self.barButton setTarget: self.revealViewController];
        [self.barButton setAction: @selector( revealToggle: )];
        self.revealViewController.rearViewRevealWidth = self.view.frame.size.width-50;
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [CMSingletonUser sharedInstance].loggedUser.cardMutableArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    

    
    UITableViewCell *reuseCell = [tableView dequeueReusableCellWithIdentifier:@"reusableCell" forIndexPath:indexPath];
    
    reuseCell.selectionStyle = UITableViewCellSelectionStyleNone;
    [reuseCell setClipsToBounds:NO];
    
    if (reuseCell == nil) {
        reuseCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reusableCell"];
        NSLog(@"cai no init da cell");
        // change style according to yours..
    }
    
    CMCard *card = [CMSingletonUser sharedInstance].loggedUser.cardMutableArray[indexPath.row];
    
    NSDictionary *imageColors = @{@"purple":@"imgCartaoRoxo",
                                  @"red":@"imgCartaoVermelho",
                                  @"green":@"imgCartaoVerde",
                                  @"brown":@"imgCartaoVerde",
                                  @"grey":@"imgCartaoVerde",
                                  @"yellow":@"imgCartaoVerde"};
    
    CGFloat screenWidth = self.view.frame.size.width;
    NSInteger size = 326;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((screenWidth / 2) - (size / 2), 5, 326, 208)];
    
    [imageView setImage:[UIImage imageNamed:[imageColors objectForKey:card.colorCard]]];
    
    [reuseCell.contentView addSubview:imageView];
    
    return reuseCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    return 170;
}


@end
