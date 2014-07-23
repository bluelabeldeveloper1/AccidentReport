//
//  HomeVC.m
//  AccidentReport
//
//  Created by macmini21 on 16/07/14.
//  Copyright (c) 2014 macmini21. All rights reserved.
//

#import "HomeVC.h"
#import "AppDelegate.h"
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

@interface HomeVC ()

@end
NSMutableArray *arrImg, *arrMenu;
@implementation HomeVC

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
    arrImg= [[NSMutableArray alloc]initWithObjects:@"icon_home_do_dont",@"icon_home_create_report",@"icon_home_saved_report",@"icon_home_profile",@"icon_home_contacts", nil];
    arrMenu= [[NSMutableArray alloc]initWithObjects:@"Do's and Don'ts",@"Create Report",@"Saved Reports",@"Edit Profile",@"Contact", nil];

	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    AppDelegate *appdelegate=  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appdelegate.lblHeading.text= @"Home";
    [appdelegate.lblHeading sizeToFit];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [NSString stringWithFormat:@"cell%d",indexPath.row];
     tableView.separatorColor= [UIColor clearColor];
    //[tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!Cell){
        Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    Cell.imageView.image= [UIImage imageNamed:[NSString stringWithFormat:@"%@", [arrImg objectAtIndex:indexPath.row]]];
    Cell.textLabel.text= [arrMenu objectAtIndex:indexPath.row];
    Cell.textLabel.textColor= [UIColor whiteColor];
    [Cell.textLabel setFont:[UIFont fontWithName:@"Avenir Next Condensed" size:35]];
    Cell.backgroundColor= [UIColor clearColor];
    UIView *seprator;
    if(indexPath.row!=4)
    {
        if(IS_IPHONE_5)
        {
            seprator= [[UIView alloc]initWithFrame:CGRectMake(0,97, Cell.frame.size.width, 3)];
        }
        else
        {
            seprator= [[UIView alloc]initWithFrame:CGRectMake(0,79, Cell.frame.size.width, 3)];
        }
        seprator.backgroundColor= [UIColor whiteColor];
        [Cell addSubview:seprator];
    }
    
    Cell.selectionStyle=UITableViewCellSelectionStyleNone;
    Cell.backgroundColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_strip"]];
    
    return Cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0)
    {
        [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"DoDontVC"]
                                             animated:YES];
    }
    if(indexPath.row==1)
    {
        [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"CreateReportVC"]
                                             animated:YES];
    }
    if(indexPath.row==2)
    {
        [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"SavedReport"]
                                             animated:YES];
    }
    if(indexPath.row==3)
    {
        [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"ProfileVC"]
                                             animated:YES];
    }
    if(indexPath.row==4)
    {
        [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"contact"]
                                             animated:YES];
    }

    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(IS_IPHONE_5)
    {
        return 100;
    }
    else
    {
        return 82;
    }
}
@end
