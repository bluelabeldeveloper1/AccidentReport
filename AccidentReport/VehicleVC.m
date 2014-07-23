//
//  VehicleVC.m
//  AccidentReport
//
//  Created by macmini21 on 18/07/14.
//  Copyright (c) 2014 macmini21. All rights reserved.
//

#import "VehicleVC.h"

@interface VehicleVC ()


@end

@implementation VehicleVC
NSMutableArray *Heading;
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
    //Heading = [[NSMutableArray alloc]initWithObjects:@"DRIVER'S NAME",@"DRIVER'S ADDRESS",@"DRIVER'S PHONE NUMBER",@"DRIVER'S EMAIL",nil];
   Heading = [[NSMutableArray alloc]initWithObjects:@"DRIVER'S NAME",@"DRIVER'S ADDRESS",@"DRIVER'S PHONE NUMBER",@"DRIVER'S EMAIL",@"OWNER'S EMAIL",@"INSURANCE CARRIER",@"POLICY NUMBER",@"VEHICLE YEAR",@"VEHICLE MAKE",@"VEHICLE MODEL",@"VEHICLE COLOR",@"VEHICLE V.I.N.#",@"DESCRIPTION OF DAMAGE", nil];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return Heading.count*2;
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


    if(indexPath.row!=27)
    {
    if(indexPath.row%2!=0)
    {
        Cell.backgroundColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"text_field"]];
        txtfield.hidden= NO;
    }
    else
    {
        
        Cell.textLabel.frame= CGRectMake(0, 200, Cell.textLabel.frame.size.width, Cell.textLabel.frame.size.height);
        Cell.textLabel.text= [NSString stringWithFormat:@"%@",[Heading objectAtIndex:indexPath.row/2]];
    }
    }
    if(indexPath.row==26)
    {
        Cell.backgroundColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"text_field"]];
        UITextView *txtview= [[UITextView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
        [Cell addSubview:txtview];
        txtview.backgroundColor= [UIColor clearColor];
    }
    return Cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==25)
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
    [textField resignFirstResponder];
    
    return YES;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [self.view endEditing:YES];
}

@end
