//
//  ViewController.m
//  AccidentReport
//
//  Created by macmini21 on 16/07/14.
//  Copyright (c) 2014 macmini21. All rights reserved.
//

#import "ViewController.h"
#import "SideMenuViewController.h"
#import "HomeVC.h"
#import "AppDelegate.h"
#import "DoDontVC.h"
#import "SideMenuCell.h"
#import "ProfileVC.h"
#import "CreateReportVC.h"
#import "SavedReportVC.h"
#import "ReviewReportVC.h"
@interface ViewController ()
{
    UINavigationController *nav;
}

@end
SideMenuViewController *objSideMenuViewController;
BOOL isopen;
NSMutableArray *arrImg;
AppDelegate *appdelegate;
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    arrImg= [[NSMutableArray alloc]initWithObjects:@"side_icon_cancel_report",@"side_icon_do_dont",@"side_icon_create_report",@"side_icon_saved_report",@"side_icon_profile",@"side_icon_contact", nil];
   // self.tblMenu.backgroundColor = [UIColor colorWithRed: 205 green:205 blue:205 alpha:1];
//    UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_side_menu"]];
//    [self.tblMenu setBackgroundView:bg];
    
    _arrMenu= [[NSMutableArray alloc]initWithObjects:@"Cancel Report",@"Do's and Don'ts",@"Create Report",@"Saved Reports",@"Edit Profile",@"Contact", nil];
    self.lblHead.text= @"Contain";
    [self.lblHead sizeToFit];
    appdelegate=  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appdelegate.lblHeading= self.lblHead;
    isopen= NO;
    
      
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSideMenuClicked:(id)sender {
    
    [self openSidemenu];
}

- (IBAction)btnHomeClicked:(id)sender {
    
    [nav popToRootViewControllerAnimated:YES];
    

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    nav= segue.destinationViewController;
    
}
- (void)openSidemenu
{
    if(!isopen)
    {
        _mainContainerView.userInteractionEnabled = NO;

        [UIView animateWithDuration:0.3 animations:^{
            
            
            CGRect finalFrame =self.sideView.frame;
            finalFrame.origin.x = self.view.frame.size.width-self.sideView.frame.size.width;
            self.sideView.frame= finalFrame;

            
            _mainContainerView.frame = CGRectMake(-self.sideView.frame.size.width, _mainContainerView.frame.origin.y, _mainContainerView.frame.size.width, _mainContainerView.frame.size.height);
            _headerView.frame=CGRectMake(-self.sideView.frame.size.width, _headerView.frame.origin.y, _headerView.frame.size.width, _headerView.frame.size.height);
            //            //        _mainContainerView.transform = CGAffineTransformMakeScale(0.6, 0.6);
               }completion:^(BOOL finished) {
           
                  
                   
               }];
            isopen=YES;

           }
    else
    {
        _mainContainerView.userInteractionEnabled = YES;
        
              [UIView animateWithDuration:0.3 animations:^{
                 //        _mainContainerView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                  CGRect finalFrame = self.sideView.frame;
            finalFrame.origin.x = self.view.frame.size.width +10;
                  self.sideView.frame = finalFrame;
                  _mainContainerView.frame = CGRectMake(0, _mainContainerView.frame.origin.y, _mainContainerView.frame.size.width, _mainContainerView.frame.size.height);
              _headerView.frame = CGRectMake(0, _headerView.frame.origin.y, _headerView.frame.size.width, _headerView.frame.size.height);
              }];
             isopen= NO;

        
    }
    
    
    }
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"Cell";
    UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    tableView.separatorColor= [UIColor clearColor];
    
    if(!Cell){
        Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
           }
    UIImageView *img= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"acitive_side_menu"]];
    Cell.selectedBackgroundView= img;
    Cell.imageView.image= [UIImage imageNamed:[NSString stringWithFormat:@"%@", [arrImg objectAtIndex:indexPath.row]]];
    Cell.textLabel.text= [_arrMenu objectAtIndex:indexPath.row];
    Cell.textLabel.textColor= [UIColor whiteColor];
    [Cell.textLabel setFont:[UIFont fontWithName:@"Avenir Next Condensed" size:18]];
    Cell.backgroundColor= [UIColor clearColor];
   // Cell.backgroundColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_side_menu"]];
  
    
    return Cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _mainContainerView.userInteractionEnabled = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        //        _mainContainerView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
        CGRect finalFrame = self.sideView.frame;
        finalFrame.origin.x = self.view.frame.size.width +10;
        self.sideView.frame = finalFrame;
        _mainContainerView.frame = CGRectMake(0, _mainContainerView.frame.origin.y, _mainContainerView.frame.size.width, _mainContainerView.frame.size.height);
        _headerView.frame = CGRectMake(0, _headerView.frame.origin.y, _headerView.frame.size.width, _headerView.frame.size.height);
    }];
    isopen= NO;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    if(indexPath.row==0)
//    {
//        ReviewReportVC *yourViewController = (ReviewReportVC *)[storyboard instantiateViewControllerWithIdentifier:@"ReviewReport"];
//        [nav pushViewController:yourViewController animated:NO];
//    }
    if(indexPath.row==1)
    {
        DoDontVC *yourViewController = (DoDontVC *)[storyboard instantiateViewControllerWithIdentifier:@"DoDontVC"];
        [nav pushViewController:yourViewController animated:NO];
    }
    if(indexPath.row==2)
    {
        CreateReportVC *yourViewController = (CreateReportVC *)[storyboard instantiateViewControllerWithIdentifier:@"CreateReportVC"];
        [nav pushViewController:yourViewController animated:NO];
    }

    if(indexPath.row==3)
    {
        SavedReportVC *yourViewController = (SavedReportVC *)[storyboard instantiateViewControllerWithIdentifier:@"SavedReport"];
        [nav pushViewController:yourViewController animated:NO];
        
    }
    if(indexPath.row==4)
    {
        ProfileVC *yourViewController = (ProfileVC *)[storyboard instantiateViewControllerWithIdentifier:@"ProfileVC"];
        [nav pushViewController:yourViewController animated:NO];

    }
    if(indexPath.row==5)
    {
        ProfileVC *yourViewController = (ProfileVC *)[storyboard instantiateViewControllerWithIdentifier:@"contact"];
        [nav pushViewController:yourViewController animated:NO];
        
    }
       //
}
//- (IBAction)btnSample:(id)sender {
//
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    DoDontVC *yourViewController = (DoDontVC *)[storyboard instantiateViewControllerWithIdentifier:@"DoDontVC"];
////    [self.navigationController pushViewController:yourViewController animated:YES];
////    
////    DoDontVC *next= [[DoDontVC alloc]initWithNibName:@"DoDontVC" bundle:nil];
//    [nav pushViewController:yourViewController animated:NO];
//
//    
//}
@end
