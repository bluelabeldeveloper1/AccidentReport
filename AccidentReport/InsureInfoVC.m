//
//  InsureInfoVC.m
//  AccidentReport
//
//  Created by macmini21 on 18/07/14.
//  Copyright (c) 2014 macmini21. All rights reserved.
//

#import "InsureInfoVC.h"

@interface InsureInfoVC ()

@end
NSMutableArray *insureArr;
@implementation InsureInfoVC

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
    insureArr = [[NSMutableArray alloc]initWithObjects:@"DRIVER'S NAME",@"VEHICLE YEAR",@"VEHICLE MAKE",@"VEHICLE MODEL",@"VEHICLE V.I.N #",@"VEHICLE COLOR",@"DESCRIPTION/LOCATION OF DAMAGE", @"WAS THE VEHICLE TOWED",nil];
    
    

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return insureArr.count*2;
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
    txtfield.delegate= self;
    [txtfield setFont:[UIFont fontWithName:@"Avenir Next Condensed" size:15]];
    [txtfield setTextColor:[UIColor darkGrayColor]];


   if(indexPath.row!=15 && indexPath.row!=13)
   {
        if(indexPath.row%2!=0)
        {
            Cell.backgroundColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"text_field"]];
            txtfield.hidden= NO;
        }
        else
        {
            
            Cell.textLabel.frame= CGRectMake(0, 200, Cell.textLabel.frame.size.width, Cell.textLabel.frame.size.height);
            Cell.textLabel.text= [NSString stringWithFormat:@"%@",[insureArr objectAtIndex:indexPath.row/2]];
        }
   }
    if(indexPath.row==15)
    {
            CGRect imgframe= CGRectMake(20, 5, 10, 10);
            CGRect lblframe= CGRectMake(20, 0, 45, 20);
            for(int i=0;i<2;i++)
            {
                UIButton *img= [[UIButton alloc]initWithFrame:imgframe];
                [img setImage:[UIImage imageNamed:@"check_box"] forState:UIControlStateNormal];
                [img addTarget:self action:@selector(checkmark:) forControlEvents:UIControlEventTouchUpInside];                [Cell addSubview:img];
                
                lblframe.origin.x= imgframe.origin.x+imgframe.size.width+5;
                
                
                
                UILabel *lbl1= [[UILabel alloc]initWithFrame:lblframe];
                if(i==0)
                {
                    lbl1.text= @"Yes";
                }
                else if(i==1)
                {
                    lbl1.text= @"No";
                    
                }
               
                [lbl1 setFont:[UIFont fontWithName:@"Avenir Next Condensed" size:17]];
                [lbl1 sizeToFit];
                [Cell addSubview:lbl1];
                
                imgframe.origin.x= lblframe.origin.x+lblframe.size.width-15;

        }
            UILabel *lbl= [[UILabel alloc]initWithFrame:CGRectMake(120, 0, 50, 20)];
            [lbl setFont:[UIFont fontWithName:@"Avenir Next Condensed" size:17]];
            lbl.text=@"If so, to where:";
            [lbl sizeToFit];
            [Cell addSubview:lbl];
            UITextField *txt=[[UITextField alloc]initWithFrame:CGRectMake(210, 3, 100, 20)];
            txt.backgroundColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"text_field"]];

            [Cell addSubview:txt];

            
        }
    if(indexPath.row==13)
    {
        Cell.backgroundColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"text_field"]];

        UITextView *txtview= [[UITextView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
        [Cell addSubview:txtview];
        txtview.backgroundColor= [UIColor clearColor];

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
    if(indexPath.row==13)
    {
        return 60;
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
    [textField resignFirstResponder];
    
    return YES;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [self.view endEditing:YES];
}


@end
