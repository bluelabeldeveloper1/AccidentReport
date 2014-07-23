//
//  WitnessVC.m
//  AccidentReport
//
//  Created by macmini21 on 18/07/14.
//  Copyright (c) 2014 macmini21. All rights reserved.
//

#import "WitnessVC.h"

@interface WitnessVC ()

@end
NSMutableArray *witnessArr;
@implementation WitnessVC

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
    return witnessArr.count*2;
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


    if(indexPath.row%2!=0)
    {
        Cell.backgroundColor= [UIColor colorWithPatternImage:[UIImage imageNamed:@"text_field"]];
        txtfield.hidden= NO;
    }
    else
    {
        
        Cell.textLabel.frame= CGRectMake(0, 200, Cell.textLabel.frame.size.width, Cell.textLabel.frame.size.height);
        Cell.textLabel.text= [NSString stringWithFormat:@"%@",[witnessArr objectAtIndex:indexPath.row/2]];
    }
    return Cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row%2!=0)
    {
        return 20;
    }
    else
    {
        return 30;
    }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [self.view endEditing:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
