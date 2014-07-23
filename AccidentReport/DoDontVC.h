//
//  DoDontVC.h
//  AccidentReport
//
//  Created by macmini21 on 16/07/14.
//  Copyright (c) 2014 macmini21. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoDontVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *txtView;
@property (weak, nonatomic) IBOutlet UILabel *lblHeading;

- (IBAction)btnDoClicked:(id)sender;

- (IBAction)btnDontClicked:(id)sender;
@end
