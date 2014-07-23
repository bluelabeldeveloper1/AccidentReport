//
//  AccidentInfoVC.m
//  AccidentReport
//
//  Created by macmini21 on 18/07/14.
//  Copyright (c) 2014 macmini21. All rights reserved.
//

#import "AccidentInfoVC.h"
#import "AppDelegate.h"

@interface AccidentInfoVC ()

@end
NSMutableArray *headArr, *weatherArr;
@implementation AccidentInfoVC

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
    weatherArr= [[NSMutableArray alloc]initWithObjects:@"Sunny",@"Windy" ,@"Rain",@"Snow",@"Ice",@"Other",nil];
   
    

	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{    }
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return headArr.count*2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [NSString stringWithFormat:@"cell%d",indexPath.row];
    
    
    UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!Cell){
        Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    Cell.backgroundColor= [UIColor clearColor];
    Cell.selectionStyle=UITableViewCellSelectionStyleNone;
    tableView.separatorColor= [UIColor clearColor];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    // Cell.textLabel.text= [NSString stringWithFormat:@"%d",indexPath.row];
    [Cell.textLabel setFont:[UIFont fontWithName:@"Avenir Next Condensed" size:18]];
    UITextField *txtfield= [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    [Cell addSubview:txtfield];
    txtfield.hidden= YES;
   

    if(indexPath.row%2!=0 && indexPath.row!=11)
    {
        UIImageView *img= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"text_field"]];
        img.frame= CGRectMake(0, 0, Cell.frame.size.width-20, Cell.frame.size.height);
        Cell.backgroundColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"text_field"]];
        //Cell.backgroundView= img;
        txtfield.hidden= NO;
        txtfield.delegate= self;
        [txtfield setFont:[UIFont fontWithName:@"Avenir Next Condensed" size:15]];
        [txtfield setTextColor:[UIColor darkGrayColor]];
    }
    else
    {
        if(indexPath.row!=11)
        {
        Cell.textLabel.frame= CGRectMake(0, 200, Cell.textLabel.frame.size.width, Cell.textLabel.frame.size.height);
        Cell.textLabel.text= [NSString stringWithFormat:@"%@",[headArr objectAtIndex:indexPath.row/2]];
        }
    }
    if(indexPath.row==9)
    {
        UITextView *txtview= [[UITextView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
        [Cell addSubview:txtview];
        txtview.backgroundColor= [UIColor clearColor];
    }
    CGRect imgframe= CGRectMake(6, 5, 10, 10);
    CGRect lblframe= CGRectMake(20, 0, 45, 20);

    if(indexPath.row==11)
    {
        for(int i=0; i<6;i++)
        {
            
            UIButton *img= [[UIButton alloc]initWithFrame:imgframe];
            [img setImage:[UIImage imageNamed:@"check_box"] forState:UIControlStateNormal];
            [img addTarget:self action:@selector(checkmark:) forControlEvents:UIControlEventTouchUpInside];
            
           // UIImageView *img= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"check_box_act"]];
            //img.frame= imgframe;
            [Cell addSubview:img];
            
            lblframe.origin.x= imgframe.origin.x+imgframe.size.width+5;
            
            UILabel *lbl1= [[UILabel alloc]initWithFrame:lblframe];
            lbl1.text= [weatherArr objectAtIndex:i];
            [lbl1 setFont:[UIFont fontWithName:@"Avenir Next Condensed" size:13]];
            [lbl1 sizeToFit];
            [Cell addSubview:lbl1];
            
            if(i==4)
            {
            imgframe.origin.x= lblframe.origin.x+lblframe.size.width-27;
 
            }
            else
            {
            imgframe.origin.x= lblframe.origin.x+lblframe.size.width-10;
            }
            
        }
    }

    return Cell;
}
-(void)checkmark:(id)sender
{
   
    UIButton *btn= sender;
    if([btn.imageView.image isEqual:[UIImage imageNamed:@"check_box_act"]])
    {
        [btn setImage:[UIImage imageNamed:@"check_box"] forState:UIControlStateNormal];
    }
    else
    {
        [btn setImage:[UIImage imageNamed:@"check_box_act"] forState:UIControlStateNormal];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==9)
    {
        return 50;
    }
    if(indexPath.row%2!=0)
    {
        return 20;
    }
    else
    {
        return 30;
    }
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
     [self.view endEditing:YES];
    [textField resignFirstResponder];
    
    return YES;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [self.view endEditing:YES];
}



@end
