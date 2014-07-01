//
//  CSTableViewController.m
//  WLStarter
//
//  Created by Carlos Santana on 6/27/14.
//  Copyright (c) 2014 Carlos Santana. All rights reserved.
//

// Set WORKLIGHT to 1 to use Worlight Server, set to 0 to use dummy data
#define WORKLIGHT 0

#import "CSTableViewController.h"
#import "CSDetailViewController.h"

#if WORKLIGHT == 1
#define WL_ADAPTER_NAME @"news"
#define WL_ADAPTER_PROCEDURE @"getStories"
#import "WLClient.h"
#import "WLProcedureInvocationData.h"
@interface CSTableViewController () <WLDelegate>

#else
@interface CSTableViewController ()
#endif


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

#if WORKLIGHT == 1
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    WLProcedureInvocationData * invocationData = [[WLProcedureInvocationData alloc] initWithAdapterName:WL_ADAPTER_NAME procedureName:WL_ADAPTER_PROCEDURE];
    [[WLClient sharedInstance] invokeProcedure:invocationData withDelegate:self];
    
}
#else
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDictionary *story1 = @{@"title":         @"Worklight new version released",
                             @"description":   @"Worklight 6.2 was release on June 20th 2014",
                             @"link":          @"http://ibm.com/developerworks/mobile/worklight/getting-started.html"};
    
    NSDictionary *story2 = @{@"title":         @"Worklight adds CLI Support",
                             @"description":   @"Worklight 6.2 provides a new command line interface for developers",
                             @"link":          @"http://ibm.com/support/knowledgecenter/SSZH4A_6.2.0/com.ibm.worklight.dev.doc/dev/c_wl_cli_features.html"};
    self.stories = [NSArray arrayWithObjects:story1, story2, nil];
    
}
#endif

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

#pragma mark - Worklight

#if WORKLIGHT == 1
-(void) onSuccess:(WLResponse *)response
{
    NSArray *rssStories = [response getResponseJson][@"rss"][@"channel"][@"item"];
    self.stories = rssStories;
    [self.tableView reloadData];
}
-(void) onFailure:(WLFailResponse *)response
{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Error" message:response.responseText delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
#endif


@end
