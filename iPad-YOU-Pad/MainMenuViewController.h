//
//  ViewController.h
//  iPad-YOU-Pad
//
//  Created by Andrew Edwards on 2/10/13.
//  Copyright (c) 2013 Andrew Edwards. All rights reserved.
//

#import <UIKit/UIKit.h>

extern int pin;

@interface MainMenuViewController : UIViewController

-(IBAction)pinCheck;

-(IBAction)goToKidsSurveys;
-(IBAction)goToParentsSurveys;
-(IBAction)goToEducatorsSurveys;
-(IBAction)goToCompletedSurveys;
@property (weak, nonatomic) IBOutlet UITextField *pinField;

@end
