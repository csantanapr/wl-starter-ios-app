//
//  CSDetailViewController.m
//  WLStarter
//
//  Created by Carlos Santana on 6/27/14.
//  Copyright (c) 2014 Carlos Santana. All rights reserved.
//

#import "CSDetailViewController.h"

@interface CSDetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

- (IBAction)linkButtonPressed:(UIButton *)sender;

@end

@implementation CSDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.titleLabel.text = self.story[@"title"];
    self.descriptionLabel.text = self.story[@"description"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)linkButtonPressed:(UIButton *)sender {
    NSLog(@"link button pressed");
    NSURL * url = [[NSURL alloc] initWithString:self.story[@"link"]];
    [[UIApplication sharedApplication] openURL:url];
}
@end
