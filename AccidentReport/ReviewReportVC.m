//
//  ReviewReportVC.m
//  AccidentReport
//
//  Created by macmini21 on 19/07/14.
//  Copyright (c) 2014 macmini21. All rights reserved.
//

#import "ReviewReportVC.h"
#import "SideMenuCell.h"

@interface ReviewReportVC ()

@end
NSMutableArray *headArr, *Heading ,*preoprt , *injuiryarr ,*insureArr,*policeArr, *witnessArr;
@implementation ReviewReportVC

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
    headArr = [[NSMutableArray alloc]initWithObjects:@"DATE",@"TIME",@"LOCATION OF ACCIDENT",@"LANDMARK",@"DESCRIPTION OF ACCIDENT",@"WEATHER CONDITIONS", nil];
     preoprt = [[NSMutableArray alloc]initWithObjects:@"INSURED NAME",@"MAIN CONTACT",@"ADDRESS",@"PHONE NUMBER",@"EMAIL ADDRESS",@"POLICY NUMBER", @"EFFECTIVE DATE", @"EXPIRATION DATE", nil];
     Heading = [[NSMutableArray alloc]initWithObjects:@"DRIVER'S NAME",@"DRIVER'S ADDRESS",@"DRIVER'S PHONE NUMBER",@"DRIVER'S EMAIL",@"OWNER'S EMAIL",@"INSURANCE CARRIER",@"POLICY NUMBER",@"VEHICLE YEAR",@"VEHICLE MAKE",@"VEHICLE MAKE",@"VEHICLE MODEL",@"VEHICLE COLOR",@"VEHICLE V.I.N.#",@"DESCRIPTION OF DAMAGE", nil];
     injuiryarr = [[NSMutableArray alloc]initWithObjects:@"DID ANYONE SUFFER AN INJURY",@"FATALITY",@"WERE THE INJURED TRANSPORTED BY AMBULANCE, HELICOPTER OR POLICE VEHICLE?",@"NAME OF INJURED",@"ADDRESS",@"PHONE NUMBER",@"EMAIL", @"TRANSPORTED WHERE:",nil];
    insureArr = [[NSMutableArray alloc]initWithObjects:@"VEHICLE YEAR",@"VEHICLE MAKE",@"VEHICLE MODEL",@"VEHICLE V.I.N #",@"VEHICLE COLOR",@"DESCRIPTION/LOCATION OF DAMAGE", @"WAS THE VEHICLE TOWED",nil];
    policeArr = [[NSMutableArray alloc]initWithObjects:@"POLICE DEPARTMENT",@"WERE THE POLICE NOTIFIED?",@"OFFICER NAME",@"BADGE #",@"REPORT #",@"WAS ANYONE CITED", @"CITATIONS ISSUED",nil];
    witnessArr = [[NSMutableArray alloc]initWithObjects:@"WITNESS #1",@"NAME",@"ADDRESS",@"PHONE NUMBER",@"EMAIL",nil];

    

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 12;
    }
    
    if (section == 1)
    {
        return 14;
    }
    
    if (section == 2)
    {
        return 12;
    }
    
    if (section == 3)
    {
        return 12;
    }
    if (section == 4)
    {
        return 8;
    }
    
    if (section == 5)
    {
        return 12;
    }
    
    if (section == 6)
    {
        return 9;
    }
    if (section == 7)
    {
        return 1;
    }
    else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   // int num= indexPath.section+indexPath.row;
    NSString *identifier = [NSString stringWithFormat:@"cell%d%d",indexPath.section, indexPath.row];
   

    UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!Cell){
        Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    Cell.selectionStyle=UITableViewCellSelectionStyleNone;
    Cell.backgroundColor= [UIColor clearColor];
    if(indexPath.section==0)
    {
        if(indexPath.row%2==0)
        {
        Cell.textLabel.text= [headArr objectAtIndex:indexPath.row/2];
       

        }
    }
    if(indexPath.section==1)
    {
        if(indexPath.row%2==0)
        {
            Cell.textLabel.text= [preoprt objectAtIndex:indexPath.row/2];
            
            
        }
    }
    if(indexPath.section==2)
    {
        if(indexPath.row%2==0)
        {
            Cell.textLabel.text= [Heading objectAtIndex:indexPath.row/2];
            
            
        }
    }
    if(indexPath.section==3)
    {
        if(indexPath.row%2==0)
        {
            Cell.textLabel.text= [injuiryarr objectAtIndex:indexPath.row/2];
            
            
        }
    }
    if(indexPath.section==4)
    {
        if(indexPath.row%2==0)
        {
            Cell.textLabel.text= [insureArr objectAtIndex:indexPath.row/2];
            
            
        }
    }
    if(indexPath.section==5)
    {
        if(indexPath.row%2==0)
        {
            Cell.textLabel.text= [policeArr objectAtIndex:indexPath.row/2];
            
            
        }
    }
    if(indexPath.section==6)
    {
        if(indexPath.row%2==0)
        {
            Cell.textLabel.text= [witnessArr objectAtIndex:indexPath.row/2];
            
            
        }
    }
    if(indexPath.section==7)
    {
        UIImageView *img= [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 255, 255)];
        img.image= [UIImage imageNamed:@"add_photo"];
        [Cell addSubview:img];
        
        UIImageView *img2= [[UIImageView alloc]initWithFrame:CGRectMake(10, 280, 255, 300)];
        img2.image= [UIImage imageNamed:@"map"];
        [Cell addSubview:img2];
        
        UIButton *btn1= [[UIButton alloc]initWithFrame:CGRectMake(10, 600, 150, 50)];
        [btn1 setImage:[UIImage imageNamed:@"btn_save"] forState:UIControlStateNormal];
        [Cell addSubview:btn1];

        UIButton *btn2= [[UIButton alloc]initWithFrame:CGRectMake(160, 600, 140, 50)];
        [btn2 setImage:[UIImage imageNamed:@"btn_submit_on"] forState:UIControlStateNormal];
        [Cell addSubview:btn2];

    }
   
     [Cell.textLabel setFont:[UIFont fontWithName:@"Avenir Next Condensed" size:18]];
    return Cell;
}
- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section {
    
    return 37;
}
-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    /*SideMenuCell *cell = (SideMenuCell*)[tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    tableView.separatorColor= [UIColor clearColor];
    if (cell == nil)
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SideMenuCell" owner:self options:nil] objectAtIndex:0];*/

    
    static NSString *CellIdentifier = @"SectionHeader";
    UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    UILabel *lblTitle= (UILabel*)[headerView viewWithTag:100];
    UIButton *btnEdit= (UIButton *)[headerView viewWithTag:200];
   
    if (section == 0)
    {
        lblTitle.text= @"ACCIDENT INFORMATION";
            }
    
    if (section == 1)
    {
        lblTitle.text= @"DRIVER INFORMATION";
        
    }
    
    if (section == 2)
    {
        lblTitle.text= @"OTHER VEHICLE INFORMATION";
         
    }
    
    if (section == 3)
    {
        lblTitle.text= @"INJURIES";
    }
    if (section == 4)
    {
        lblTitle.text= @"INSURED VEHICLE INFORMATION";
    }

    if (section == 5)
    {
        lblTitle.text= @"POLICE INVESTIGATION";
    }
    if (section == 6)
    {
        lblTitle.text= @"WITNESS";
    }

    if (section == 7)
    {
        lblTitle.text= @"PHOTOS & ACCIDENT SCENE";
    }
    [lblTitle sizeToFit];

    headerView.backgroundColor= [UIColor clearColor];
    if (headerView == nil){
        [NSException raise:@"headerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
    }
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==7 && indexPath.row==0)
    {
        return 650;
    }
    else
    {
        return  37;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 8;
}// Default is 1 if not implemented

- (IBAction)editButtonClicked:(id)sender {
    UIButton *btn= sender;
    NSLog(@"%d",btn.tag);
}
- (IBAction)btnEditClicked:(id)sender {
    NSLog(@"btn Edit");
}
@end
