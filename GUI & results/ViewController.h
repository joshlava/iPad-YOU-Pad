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
extern int answers[40];
extern int selected[40];
extern NSFileManager *fm;
extern NSArray *paths;
extern NSString *docDir;
extern NSString *filePath;

@interface ViewController : UIViewController
{
    IBOutlet UITextView *textView;    
    __weak IBOutlet UINavigationItem *firstQuestionNavBar;
    __weak IBOutlet UINavigationItem *endOfSurvey;
}

- (IBAction)answer:(id)sender;
- (IBAction)submit:(id)sender;
- (IBAction)childDifficultiesNext:(id)sender;
- (IBAction)s1117ImpactSuppButtonPress:(id)sender;
- (IBAction)impactSuppNext:(id)sender;


@end
