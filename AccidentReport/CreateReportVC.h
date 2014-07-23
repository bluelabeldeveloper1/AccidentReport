//
//  CreateReportVC.h
//  AccidentReport
//
//  Created by macmini21 on 17/07/14.
//  Copyright (c) 2014 macmini21. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateReportVC : UIViewController<UIScrollViewDelegate, UITextViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIPageControl *pagecontroll;
@property (nonatomic, strong) NSMutableArray *pageViews;
@property (nonatomic) int prevIndex;
@property (nonatomic) int currIndex;
@property (nonatomic) int nextIndex;
@property (assign) BOOL pageControlUsed;
@property (assign) BOOL fromLastPage;

- (IBAction)changePage:(id)sender;
- (IBAction)btnBackClicked:(id)sender;
- (IBAction)btnNextClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *alertView;
- (IBAction)btnRemove:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *backbtn;
@property (weak, nonatomic) IBOutlet UIButton *nextbtn;
@property (weak, nonatomic) IBOutlet UIView *ReportView;
- (IBAction)btnEditClicked:(id)sender;
- (IBAction)btnalertRemove:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *reviewAlert;
@end
