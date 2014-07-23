//
//  SideMenuViewController.m
//  My_Tattoo
//
//  Created by macmini08 on 22/01/14.
//
//

#import "SideMenuViewController.h"
#import "SideMenuCell.h"
#import <objc/message.h>
#import "DoDontVC.h"
#import "ProfileVC.h"
#import "AppDelegate.h"


//#import "FormattedStrings.h"

@interface SideMenuViewController ()

@end

@implementation SideMenuViewController

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
    [self initializeOnce];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [_tblMenu flashScrollIndicators];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Initialization

-(void)initializeOnce
{
    _lblCopyrightNotice.text = [NSString stringWithFormat:kCopyrightText,[CommonSideMenuController getStringFromDate:[NSDate date] withFormat:@"yyyy"]];
    _lblVersionInfo.text = [NSString stringWithFormat:kVersionText,[CommonSideMenuController appVersion]];
    _lblAppNAme.font = [UIFont fontWithName:@"Pacifico" size:22.0];

    _arrMenu = [[NSMutableArray alloc] init];
    
    ClsMenu *objMenu = [[ClsMenu alloc] init];
    objMenu.strMenuTitle = @"Cancel Report";
    objMenu.imgMenuIcon = [UIImage imageNamed:@"side_icon_cancel_report.png"];
    objMenu.intId = _arrMenu.count;
     objMenu.actionToPerform = @selector(cancelClick);
    [_arrMenu addObject:objMenu];
    
    objMenu = [[ClsMenu alloc] init];
    objMenu.strMenuTitle = @"Do's and Don'ts";
    objMenu.imgMenuIcon = [UIImage imageNamed:@"side_icon_do_dont.png"];
    objMenu.intId = _arrMenu.count;
    objMenu.actionToPerform = @selector(DoClick);
    [_arrMenu addObject:objMenu];
    
    objMenu = [[ClsMenu alloc] init];
    objMenu.strMenuTitle = @"Create Report";
    objMenu.imgMenuIcon = [UIImage imageNamed:@"side_icon_create_report.png"];
    objMenu.intId = _arrMenu.count;
    objMenu.actionToPerform = @selector(CreateClick);
    [_arrMenu addObject:objMenu];
    
    objMenu = [[ClsMenu alloc] init];
    objMenu.strMenuTitle = @"Saved Reports";
    objMenu.imgMenuIcon = [UIImage imageNamed:@"side_icon_saved_report.png"];
    objMenu.intId = _arrMenu.count;
    objMenu.actionToPerform = @selector(SavedClick);
    [_arrMenu addObject:objMenu];
    
    objMenu = [[ClsMenu alloc] init];
    objMenu.strMenuTitle = @"Edit Profile";
    objMenu.imgMenuIcon = [UIImage imageNamed:@"icon_home_profile.png"];
    objMenu.intId = _arrMenu.count;
    objMenu.actionToPerform = @selector(ProfileClick);
    [_arrMenu addObject:objMenu];

       
    objMenu = [[ClsMenu alloc] init];
    objMenu.strMenuTitle = @"Contact";
    objMenu.imgMenuIcon = [UIImage imageNamed:@"side_icon_contact.png"];
    objMenu.intId = _arrMenu.count;
    objMenu.actionToPerform = @selector(ContactClick);
    [_arrMenu addObject:objMenu];
    

    [_tblMenu reloadData];
    [_tblMenu setShowsVerticalScrollIndicator:YES];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrMenu.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SideMenuCell *cell = (SideMenuCell*)[tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    tableView.separatorColor= [UIColor clearColor];
    if (cell == nil)
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SideMenuCell" owner:self options:nil] objectAtIndex:0];
    
    ClsMenu *objTmpMenu = [_arrMenu objectAtIndex:indexPath.row];
    cell.imgMenuIcon.image = objTmpMenu.imgMenuIcon;
    cell.imgMenuIcon.contentMode = UIViewContentModeScaleAspectFit;
    //cell.imgMenuIcon.frame = CGRectMake(5, 12, 20, 20);
    cell.lblMenuTItle.text = objTmpMenu.strMenuTitle;
    cell.lblPoints.hidden=YES;
    cell.backgroundColor = [UIColor clearColor];
    //cell.indentationWidth = 20;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
  // return (indexPath.row > 1 && indexPath.row < 5) ? 2 : 0;
   return 0;

}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClsMenu *objTmpMenu = [_arrMenu objectAtIndex:indexPath.row];

    if (objTmpMenu.actionToPerform && [self respondsToSelector:objTmpMenu.actionToPerform])
    {
        if ([_delegate respondsToSelector:@selector(closeMenu)])
            [_delegate closeMenu];
        
        objc_msgSend(self, objTmpMenu.actionToPerform);
    }
}

#pragma Selectors

- (void)cancelClick
{
    
}

- (void)DoClick
{
    DoDontVC *next= [[DoDontVC alloc]initWithNibName:@"DoDontVC" bundle:nil];
    UINavigationController *nav= [[UINavigationController alloc]init];
    nav= next.navigationController;
    
    [nav pushViewController:next animated:NO];
    
    
  }

- (void)CreateClick
{
    
}

- (void)SavedClick
{
    
}

- (void)ProfileClick
{
    ProfileVC *next= [[ProfileVC alloc]initWithNibName:@"ProfileVC" bundle:nil];
    
    [self.navigationController pushViewController:next animated:NO];
}

- (void)ContactClick
{
    
}

@end