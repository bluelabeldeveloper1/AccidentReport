//
//  ProfileVC.h
//  AccidentReport
//
//  Created by macmini21 on 16/07/14.
//  Copyright (c) 2014 macmini21. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileVC : UIViewController<UITextFieldDelegate>
- (IBAction)backButtonClicked:(id)sender;
- (IBAction)btnNextClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnBack;

@property (weak, nonatomic) IBOutlet UIButton *btnNext;

@end
