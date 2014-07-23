//
//  MapVC.m
//  AccidentReport
//
//  Created by macmini21 on 19/07/14.
//  Copyright (c) 2014 macmini21. All rights reserved.
//

#import "MapVC.h"

@interface MapVC ()

@end

@implementation MapVC

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
  

	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    }
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnContinueclicked:(id)sender {
    CGRect frame= self.alert.frame;
    frame.origin.x= self.view.frame.size.width+10;
    self.alert.frame= frame;
}
@end
