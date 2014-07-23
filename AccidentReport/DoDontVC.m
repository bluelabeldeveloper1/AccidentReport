//
//  DoDontVC.m
//  AccidentReport
//
//  Created by macmini21 on 16/07/14.
//  Copyright (c) 2014 macmini21. All rights reserved.
//

#import "DoDontVC.h"
#import "AppDelegate.h"

@interface DoDontVC ()

@end
NSString *doString, *dontstring;
@implementation DoDontVC

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
   
    AppDelegate *appdelegate=  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appdelegate.lblHeading.text= @"DO's and Don'ts";
    [appdelegate.lblHeading sizeToFit];

    doString= @"doString doString doString doString doString doString ";
    dontstring= @"dontstring dontstring dontstring dontstring dontstring ";
    
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(handleSwipeLeft)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.txtView addGestureRecognizer:swipeLeft];
    
    //right swipe
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]
                                            initWithTarget:self
                                            action:@selector(handleSwipeRight)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.txtView addGestureRecognizer:swipeRight];
    

	 //self.txtView.text= doString;
    self.txtView.editable= NO;
    // Do any additional setup after loading the view.
}
-(void)handleSwipeRight
{
   self.lblHeading.text= @"DO...";
//    self.txtView.text= doString;
}
-(void)handleSwipeLeft
{
    self.lblHeading.text= @"DON'T...";
//    
//    self.txtView.text= dontstring;
    

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnDoClicked:(id)sender {
   self.lblHeading.text= @"DO...";
//    self.txtView.text= doString;
}

- (IBAction)btnDontClicked:(id)sender {
  self.lblHeading.text= @"DON'T...";
//
//    self.txtView.text= dontstring;

}
@end
