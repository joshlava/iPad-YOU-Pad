//
//  ViewController.h
//  radio
//
//  Created by Admin on 23/09/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

extern BOOL runOnce;
extern BOOL s1117ImpactSupplement;
extern BOOL s1117FollowUp;
extern int answers[50];
extern int selected[50];
extern NSFileManager *fm;
extern NSArray *paths;
extern NSString *docDir;
extern NSString *filePath;
extern NSString *kidsID;
extern NSString *kidsName;
extern NSString *researcherName;

@interface KidsSurveysViewController : UIViewController
{
    __weak IBOutlet UINavigationItem *firstQuestionNavBar;
    __weak IBOutlet UINavigationItem *endOfSurvey;
    IBOutlet UITextField *kidsID;
    IBOutlet UITextField *kidsName;
    IBOutlet UITextField *researcherName;
}

- (IBAction)answer:(id)sender;
- (IBAction)submit:(id)sender;
- (IBAction)childDifficultiesNext:(id)sender;
- (IBAction)s1117ImpactSuppButtonPress:(id)sender;
- (IBAction)forkNext:(id)sender;
- (IBAction)s1117FollowUpButtonPress:(id)sender;
- (IBAction)goToMainMenu;
- (IBAction)createFile:(id)sender;
- (IBAction)saveInfo:(id)sender;
- (IBAction)infoEntered:(id)sender;


@end
