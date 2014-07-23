//
//  CreateReportVC.m
//  AccidentReport
//
//  Created by macmini21 on 17/07/14.
//  Copyright (c) 2014 macmini21. All rights reserved.
//

#import "CreateReportVC.h"
#import "ReviewReportVC.h"
#import "AppDelegate.h"
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

@interface CreateReportVC()
{
NSArray *contentArr;
NSMutableArray *headArr, *Heading ,*preoprt , *injuiryarr ,*insureArr,*policeArr, *witnessArr;
}
@end
UIView *view;
float scrlheight;
AppDelegate *appdelegate;
@implementation CreateReportVC

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
    appdelegate=  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appdelegate.lblHeading.text= @"File Report";
    [appdelegate.lblHeading sizeToFit];
    appdelegate.InfoFill= NO;
    
    headArr = [[NSMutableArray alloc]initWithObjects:@"DATE",@"TIME",@"LOCATION OF ACCIDENT",@"LANDMARK",@"DESCRIPTION OF ACCIDENT",@"WEATHER CONDITIONS", nil];
    preoprt = [[NSMutableArray alloc]initWithObjects:@"INSURED NAME",@"MAIN CONTACT",@"ADDRESS",@"PHONE NUMBER",@"EMAIL ADDRESS",@"POLICY NUMBER", @"EFFECTIVE DATE", @"EXPIRATION DATE", nil];
    Heading = [[NSMutableArray alloc]initWithObjects:@"DRIVER'S NAME",@"DRIVER'S ADDRESS",@"DRIVER'S PHONE NUMBER",@"DRIVER'S EMAIL",@"OWNER'S EMAIL",@"INSURANCE CARRIER",@"POLICY NUMBER",@"VEHICLE YEAR",@"VEHICLE MAKE",@"VEHICLE MAKE",@"VEHICLE MODEL",@"VEHICLE COLOR",@"VEHICLE V.I.N.#",@"DESCRIPTION OF DAMAGE", nil];
    injuiryarr = [[NSMutableArray alloc]initWithObjects:@"DID ANYONE SUFFER AN INJURY",@"FATALITY",@"WERE THE INJURED TRANSPORTED BY AMBULANCE, HELICOPTER OR POLICE VEHICLE?",@"NAME OF INJURED",@"ADDRESS",@"PHONE NUMBER",@"EMAIL", @"TRANSPORTED WHERE:",nil];
    insureArr = [[NSMutableArray alloc]initWithObjects:@"DRIVER'S NAME",@"VEHICLE YEAR",@"VEHICLE MAKE",@"VEHICLE MODEL",@"VEHICLE V.I.N #",@"VEHICLE COLOR",@"DESCRIPTION/LOCATION OF DAMAGE", @"WAS THE VEHICLE TOWED",nil];
    policeArr = [[NSMutableArray alloc]initWithObjects:@"POLICE DEPARTMENT",@"WERE THE POLICE NOTIFIED?",@"OFFICER NAME",@"BADGE #",@"REPORT #",@"WAS ANYONE CITED", @"CITATIONS ISSUED",nil];
    witnessArr = [[NSMutableArray alloc]initWithObjects:@"WITNESS #1",@"NAME",@"ADDRESS",@"PHONE NUMBER",@"EMAIL",nil];
    

    
    
    
   /* self.pagecontroll.pageIndicatorTintColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"slide_dot"]];
    self.pagecontroll.currentPageIndicatorTintColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"slice_dot_act"]];*/
   
    self.scrollview.pagingEnabled = YES;
    self.scrollview.contentSize = CGSizeMake(self.scrollview.frame.size.width * 5, self.scrollview.frame.size.height);
    self.scrollview.showsHorizontalScrollIndicator = NO;
    self.scrollview.showsVerticalScrollIndicator = NO;
    self.scrollview.scrollsToTop = NO;
    self.scrollview.delegate = self;

    
   contentArr =  [[NSArray alloc]
     initWithObjects:
    [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileReport"],
    [self.storyboard instantiateViewControllerWithIdentifier:@"AccidentInfo"],
    [self.storyboard instantiateViewControllerWithIdentifier:@"InsureInfo"],
    [self.storyboard instantiateViewControllerWithIdentifier:@"Vehicle"],
    [self.storyboard instantiateViewControllerWithIdentifier:@"InjuriesInfo"],
    [self.storyboard instantiateViewControllerWithIdentifier:@"policeInvest"],
    [self.storyboard instantiateViewControllerWithIdentifier:@"Witness"],
    [self.storyboard instantiateViewControllerWithIdentifier:@"Additional"],
    [self.storyboard instantiateViewControllerWithIdentifier:@"picture"],
    [self.storyboard instantiateViewControllerWithIdentifier:@"map"],
    //[self.storyboard instantiateViewControllerWithIdentifier:@"ReviewReport"],
         nil];

    
    NSInteger pageCount = contentArr.count +1;
    

    self.pagecontroll.currentPage = 0;
    self.pagecontroll.numberOfPages = pageCount;
    

    
	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    int x_pos = 0;
    for(int i=0;i<contentArr.count;i++){
        
        UIViewController *controller = [contentArr objectAtIndex:i];
        if (controller == nil) {
            return;
        }
        UIView *view = controller.view;
        if([controller isKindOfClass:[ReviewReportVC class]])
        {
        
        view.frame = CGRectMake(x_pos, 0, 320, self.scrollview.frame.size.height+70);
        }
        else
        {
        view.frame = CGRectMake(x_pos, 0, 320, self.scrollview.frame.size.height);
        }

      
        [_scrollview addSubview:view];
        x_pos += 320;
        
    }
    self.ReportView.frame=  CGRectMake(x_pos, 0, 320, self.scrollview.frame.size.height+70);
    [_scrollview addSubview:self.ReportView];


    CGSize pagesScrollViewSize = self.scrollview.frame.size;
    self.scrollview.contentSize = CGSizeMake(pagesScrollViewSize.width * (contentArr.count+1), pagesScrollViewSize.height);
     scrlheight=  pagesScrollViewSize.height;
    CGRect frame= self.scrollview.frame;
    
    if(appdelegate.InfoFill)
    {
    frame.size.width= frame.size.width+320;
    self.pagecontroll.currentPage = 1;
    }
    
    [self.scrollview scrollRectToVisible:frame animated:YES];

    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)sender {
    _pageControlUsed = NO;
    
    if([sender isKindOfClass:[UITableView class]])
    {
        return;
    }
    
       uint page = sender.contentOffset.x / 320;
    CGRect frame= self.alertView.frame;
   // CGRect scrlframe= self.scrollview.frame;
    

    if(page==9)
    {
        
        frame.origin.x= self.view.frame.origin.x;
        self.alertView.frame= frame;
    }
    else
    {
        frame.origin.x= 1000;
        self.alertView.frame= frame;
        
    }
    if(page==10)
    {
        
        self.backbtn.hidden=YES;
        self.nextbtn.hidden=YES;
        CGRect frame= self.scrollview.frame;
        frame.size.height= frame.size.height+70;
        self.scrollview.frame=frame;
        NSLog(@"%f",self.scrollview.contentSize.width);
        
    }
    else
    {
        self.backbtn.hidden=NO;
        self.nextbtn.hidden=NO;
        CGRect frame= self.scrollview.frame;
        frame.size.height= scrlheight;
        self.scrollview.frame=frame;
    }
    [self.pagecontroll setCurrentPage:page];
    
  }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)changePage:(id)sender {
    UIPageControl *pager=sender;
    int page = pager.currentPage;
    CGRect frame1= self.alertView.frame;
    if(page==9)
    {
        
        frame1.origin.x= self.view.frame.origin.x;
        self.alertView.frame= frame1;
    }
    else
    {
        frame1.origin.x= 500;
        self.alertView.frame= frame1;
        
    }
    if(page==10)
    {
        
        self.backbtn.hidden=YES;
        self.nextbtn.hidden=YES;
        CGRect frame= self.scrollview.frame;
        frame.size.height= frame.size.height+70;
        self.scrollview.frame=frame;
        NSLog(@"%f",self.scrollview.contentSize.width);
        
    }
    else
    {
        self.backbtn.hidden=NO;
        self.nextbtn.hidden=NO;
        CGRect frame= self.scrollview.frame;
        frame.size.height= scrlheight;
        self.scrollview.frame=frame;
    }

    CGRect frame = self.scrollview.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [self.scrollview scrollRectToVisible:frame animated:YES];
    
}

- (IBAction)btnBackClicked:(id)sender {

    int page= _pagecontroll.currentPage;
    CGRect frame1= self.alertView.frame;
    
    page= page-1;
    if(page==9)
    {

        frame1.origin.x= self.view.frame.origin.x;
        self.alertView.frame= frame1;
    }
    else
    {
        frame1.origin.x= 500;
        self.alertView.frame= frame1;
        
    }

    [self.pagecontroll setCurrentPage:page];
    NSLog(@"%d",page);
    CGRect frame = self.scrollview.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [self.scrollview scrollRectToVisible:frame animated:YES];
}

- (IBAction)btnNextClicked:(id)sender {
    int page= _pagecontroll.currentPage;
    page= page+1;
    CGRect frame1= self.alertView.frame;
    CGRect frame2= self.reviewAlert.frame;
    
//    if(self.fromLastPage)
//    {
//        page=10;
//        self.fromLastPage=NO;
//    }
    if(page==9)
    {
        
        frame1.origin.x= self.view.frame.origin.x;
        self.alertView.frame= frame1;
      
    }
    else
    {
        frame1.origin.x= 500;
        self.alertView.frame= frame1;
        
    }
    if(page==10)
    {
        frame2.origin.x= self.view.frame.origin.x;
        self.reviewAlert.frame= frame2;

        self.backbtn.hidden=YES;
        self.nextbtn.hidden=YES;
        CGRect frame= self.scrollview.frame;
        frame.size.height= frame.size.height+70;
        self.scrollview.frame=frame;
        NSLog(@"%f",self.scrollview.contentSize.width);
       
    }
    else
    {
        frame2.origin.x= 500;
        self.reviewAlert.frame= frame2;
        self.backbtn.hidden=NO;
        self.nextbtn.hidden=NO;
        CGRect frame= self.scrollview.frame;
        frame.size.height= scrlheight;
        self.scrollview.frame=frame;
    }
    [self.pagecontroll setCurrentPage:page];
    CGRect frame = self.scrollview.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [self.scrollview scrollRectToVisible:frame animated:YES];
}
- (IBAction)btnRemove:(id)sender {
    CGRect frame1= self.alertView.frame;
    frame1.origin.x= 1000;
    self.alertView.frame= frame1;
  
}
- (IBAction)btnEdit:(id)sender {
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 16;
    }
    
    if (section == 1)
    {
        return 12;
    }
    
    if (section == 2)
    {
        return 16;
    }
    
    if (section == 3)
    {
        return 26;
    }
    if (section == 4)
    {
        return 16;
    }
    
    if (section == 5)
    {
        return 14;
    }
    
    if (section == 6)
    {
        return 9;
    }
    if (section == 7)
    {
        return 1;
    }
    if (section == 8)
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
            Cell.textLabel.text= [preoprt objectAtIndex:indexPath.row/2];
            
            
        }
    }
    if(indexPath.section==1)
    {
        if(indexPath.row%2==0)
        {
            Cell.textLabel.text= [headArr objectAtIndex:indexPath.row/2];
            
            
        }
    }
    if(indexPath.section==2)
    {
        if(indexPath.row%2==0)
        {
            Cell.textLabel.text= [insureArr objectAtIndex:indexPath.row/2];
            
            
        }
    }
    if(indexPath.section==3)
    {
        if(indexPath.row%2==0)
        {
            Cell.textLabel.text= [Heading objectAtIndex:indexPath.row/2];
            
            
        }
    }
    if(indexPath.section==4)
    {
        if(indexPath.row%2==0)
        {
            Cell.textLabel.text= [injuiryarr objectAtIndex:indexPath.row/2];
            
            
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
    }
    if(indexPath.section==8)
    {
        UIImageView *img= [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 255, 255)];
        img.image= [UIImage imageNamed:@"add_photo"];
        [Cell addSubview:img];
        
        UIImageView *img2= [[UIImageView alloc]initWithFrame:CGRectMake(10, 280, 255, 300)];
        img2.image= [UIImage imageNamed:@"map"];
        [Cell addSubview:img2];
        
        UIButton *btn1= [[UIButton alloc]initWithFrame:CGRectMake(10,600, 150, 50)];
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
        lblTitle.text= @"POLICY HOLDER INFORMATION";
       
    }
    
    if (section == 1)
    {
        lblTitle.text= @"ACCIDENT INFORMATION";

        
    }
    if (section == 2)
    {
        lblTitle.text= @"INSURED VEHICLE INFORMATION";
    }

    if (section == 3)
    {
        lblTitle.text= @"OTHER VEHICLE INFORMATION";
        
    }
    
    if (section == 4)
    {
        lblTitle.text= @"INJURIES";
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
        lblTitle.text= @"ADDITIONAL INFORMATION";
    }

    if (section == 8)
    {
        lblTitle.text= @"PHOTOS & ACCIDENT SCENE";
    }
    btnEdit.tag= section;
    [lblTitle sizeToFit];
    
    headerView.backgroundColor= [UIColor clearColor];
    if (headerView == nil){
        [NSException raise:@"headerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
    }
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==8 && indexPath.row==0)
    {
        return 650;
    }
    else
    {
        return  30;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 9;
}// Default is 1 if not implemented
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)btnEditClicked:(id)sender {
    UIButton *btn= sender;
    CGRect frame = self.scrollview.frame;
    frame.origin.x = frame.size.width * btn.tag;
    frame.origin.y = 0;
    [self.pagecontroll setCurrentPage:btn.tag];
    [self.scrollview scrollRectToVisible:frame animated:YES];
    self.backbtn.hidden=NO;
    self.nextbtn.hidden=NO;
    self.fromLastPage= YES;
    CGRect frames= self.scrollview.frame;
    frames.size.height= scrlheight;
    self.scrollview.frame=frames;

    NSLog(@"Editing %d",btn.tag);
}

- (IBAction)btnalertRemove:(id)sender {
    CGRect frame1= self.reviewAlert.frame;
    frame1.origin.x= 1000;
    self.reviewAlert.frame= frame1;
    

}
@end
