//
//  ViewController.h
//  AccidentReport
//
//  Created by macmini21 on 16/07/14.
//  Copyright (c) 2014 macmini21. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController
- (IBAction)btnSideMenuClicked:(id)sender;
- (IBAction)btnHomeClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblHead;
@property (strong,nonatomic) NSMutableArray *arrMenu;
@property (weak, nonatomic) IBOutlet UIView *mainContainerView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIView *sideView;
@property (weak, nonatomic) IBOutlet UITableView *tblMenu;
@end
