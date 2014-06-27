//
//  CSTableViewController.m
//  WLStarter
//
//  Created by Carlos Santana on 6/27/14.
//  Copyright (c) 2014 Carlos Santana. All rights reserved.
//

#import "CSTableViewController.h"
#import "CSDetailViewController.h"

@interface CSTableViewController ()

@end

@implementation CSTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.stories = [[NSMutableArray alloc] init];
    
    [self.stories addObject:@{@"title":         @"Worklight new version released",
                              @"description":   @"Worklight 6.2 was release on June 20th 2014",
                              @"link":          @"http://ibm.com/developerworks/mobile/worklight/getting-started.html"}];
    
    [self.stories addObject:@{@"title":         @"Worklight new CLI",
                              @"description":   @"Worklight 6.2 provides a new command line interface for developers",
                              @"link":          @"http://ibm.com/support/knowledgecenter/SSZH4A_6.2.0/com.ibm.worklight.dev.doc/dev/c_wl_cli_features.html"}];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.stories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = self.stories[indexPath.row][@"title"];
    cell.detailTextLabel.text = self.stories[indexPath.row][@"description"];
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    CSDetailViewController * viewController = segue.destinationViewController;
    if([viewController isKindOfClass:[CSDetailViewController class]]){
        viewController.story = self.stories[path.row];
    }
    
}


@end
