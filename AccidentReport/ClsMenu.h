//
//  ClsMenu.h
//  My_Tattoo
//
//  Created by macmini08 on 22/01/14.
//
//

#import <Foundation/Foundation.h>

@interface ClsMenu : NSObject

@property (nonatomic,assign) NSInteger intId;
@property (nonatomic,strong) UIImage *imgMenuIcon;
@property (nonatomic,strong) NSString *strMenuTitle;
@property (nonatomic,assign) SEL actionToPerform;

@end
