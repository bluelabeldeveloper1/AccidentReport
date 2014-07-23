//
//  AdditionalVC.m
//  AccidentReport
//
//  Created by macmini21 on 22/07/14.
//  Copyright (c) 2014 macmini21. All rights reserved.
//

#import "AdditionalVC.h"

@interface AdditionalVC ()

@end

@implementation AdditionalVC

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
    self.txtview.delegate= self;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    if ([self.txtview isFirstResponder] && [touch view] != self.txtview) {
        
        [self.txtview resignFirstResponder];
    }
    }
@end
