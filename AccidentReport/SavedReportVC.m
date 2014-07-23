//
//  SavedReportVC.m
//  AccidentReport
//
//  Created by macmini21 on 19/07/14.
//  Copyright (c) 2014 macmini21. All rights reserved.
//

#import "SavedReportVC.h"
#import "AppDelegate.h"
#import "reportCell.h"
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

@interface SavedReportVC ()

@end
NSMutableArray *reports;
@implementation SavedReportVC

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
    AppDelegate *appdelegate=  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appdelegate.lblHeading.text= @"Saved Reports";
    [appdelegate.lblHeading sizeToFit];
    
    reports= [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3", nil];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return reports.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
   
    UILabel *lbldate= (UILabel*)[Cell viewWithTag:100];
    UILabel *lblstatus= (UILabel *)[Cell viewWithTag:200];
    lbldate.text= @"5/1/2008";
    [lbldate sizeToFit];
    lblstatus.text= @"Submitted";
    [lblstatus sizeToFit];
    
    [tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];

    Cell.selectionStyle=UITableViewCellSelectionStyleNone;
    Cell.backgroundColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_strip"]];
    return Cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return true;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
         [reports removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else {
        NSLog(@"Unhandled editing style! %d", editingStyle);
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // This will create a "invisible" footer
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
    
    // If you are not using ARC:
    // return [[UIView new] autorelease];
}
@end
