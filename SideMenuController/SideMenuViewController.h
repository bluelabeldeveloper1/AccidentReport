//
//  SideMenuViewController.h
//  My_Tattoo
//
//  Created by macmini08 on 22/01/14.
//
//

#import <UIKit/UIKit.h>
#import "ClsMenu.h"
#import <MessageUI/MessageUI.h>
#import "CommonSideMenuController.h"

@protocol SideMenuDelegate <NSObject>

-(void)closeMenu;

@end

@interface SideMenuViewController : UIViewController <MFMailComposeViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *lblAppNAme;

@property (strong,nonatomic) NSMutableArray *arrMenu;
@property (weak, nonatomic) IBOutlet UITableView *tblMenu;
@property (assign, nonatomic) __unsafe_unretained id <SideMenuDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *lblVersionInfo;
@property (weak, nonatomic) IBOutlet UILabel *lblCopyrightNotice;

- (IBAction)btnMoreTapped:(id)sender;
- (void)showAboutController;
- (void)shareOnMail;

@end
