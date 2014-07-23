//
//  CommonSideMenuController.h
//  MemeApp
//
//  Created by macmini13 on 02/06/14.
//  Copyright (c) 2014 dunice-group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetConnection.h"
#import <QuartzCore/QuartzCore.h>
#import <sys/sysctl.h>
#import <mach/mach.h>
#import <mach/mach_host.h>

#define kInitialFBTellFriend @"Check Out Insta Meme Gram App. It's just awesome!\nhttp://goo.gl/RrQdow \n#SplendidPIC #Memes"
#define kInitialTwitterTellFriend @"Check Out Insta Meme Gram App \nhttp://goo.gl/RrQdow  \n#SplendidPIC #Memes"
#define kInitialEmailTellFriend @"Hi there, <br/><br/> Check Out Insta Meme Gram App. It's just awesome! Here's its download link: <a href=\"http://goo.gl/RrQdow\">InstaMemeGram</a>."

#define FBSUCCESS @"Posted on Facebook."
#define FBFAIL @"Could not post on Facebook. Please retry later."
#define FBCONFIGURE @"Please configure your Facebook account."
#define TWTSUCCESS @"Posted on Twitter"
#define TWTFAIL @"Could not post on Twitter. Please retry later."
#define TWTCONFIGURE @"Please configure your Twitter account."
#define MAILCONFIGURE @"Please configure your email settings."
#define MAILSUCCESS @"Email sent."
#define MAILFAIL @"Could not send the email. Please retry later."

#define kCopyrightText @"© %@ Space-O Digicom"
#define kVersionText @"Version %@"
#define kSupportMailSubjectText @"Support/Feedback Request for %@"
#define kSupportMailText @"<br />--------------<br />Device Type: %@<br />System Version: %@<br />App Version: %@<br />%@<br/>%@"
#define kImageScalledToSmallerSize @"Your photo was larger than maximum size limit. The exported version is resized to %0.fpx X %.0fpx size. Your original photo is not modified."
#define kFacebookShareInitial @"Here is Insta Meme Gram. #InstaMemeGram.\n%@"
#define kTwitterShareInitial @"Here is InstaMemeGram. #InstaMemeGram.\n%@"
#define kEmailShareInitial @"See Insta Meme Gram, attached.<br /><a href=\"%@\">%@</a>"
#define kSupportMail @"support@spaceodigicom.com"
#define kNetworkNotFoundSideMenu @"Network not found."

typedef void(^alertActionBlock)(NSInteger buttonIndex);

@interface CommonSideMenuController : NSObject

@property (copy, nonatomic) alertActionBlock pActionBlock;

+ (BOOL)isNetworkReachable;
+(NSString*)getStringFromDate:(NSDate*)pobjDate withFormat:(NSString*)pstrFormat;
+ (NSString *) appVersion;
+ (void)showAlertMessage:(NSString *)message title:(NSString*)pstrTitle response:(alertActionBlock)pBlock withButtonTitles:(NSString *)strButtons, ...NS_REQUIRES_NIL_TERMINATION;
+ (NSString*)hardwareDescription;
+(NSString *)getFreeDiskspace;
+(NSString *)MemoryStatus;

@end
