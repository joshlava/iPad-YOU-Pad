//
//  ViewController.m
//  iPad-YOU-Pad
//
//  Created by Andrew Edwards on 2/10/13.
//  Copyright (c) 2013 Andrew Edwards. All rights reserved.
//

#import "MainMenuViewController.h"

int pin = 1968;

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

-(void)pinCheck{
    int pinEntered = [_pinField.text intValue];
    if(pin == pinEntered){
        //Enter button send you to main menu
    }
}

-(void)goToSettings{
    UIStoryboard *settingsStoryboard = [UIStoryboard storyboardWithName:@"Settings" bundle:nil];
    UIViewController *initialSettingsVC = [settingsStoryboard instantiateInitialViewController];
    initialSettingsVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:initialSettingsVC animated:YES];
}

-(void)goToKidsSurveys{
    UIStoryboard *kidsStoryboard = [UIStoryboard storyboardWithName:@"KidsSurveys" bundle:nil];
    UIViewController *initialKidsVC = [kidsStoryboard instantiateInitialViewController];
    initialKidsVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:initialKidsVC animated:YES];
}

-(void)goToParentsSurveys{
    UIStoryboard *parentsStoryboard = [UIStoryboard storyboardWithName:@"ParentsSurveys" bundle:nil];
    UIViewController *initialParentsVC = [parentsStoryboard instantiateInitialViewController];
    initialParentsVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:initialParentsVC animated:YES];
}

-(void)goToEducatorsSurveys{
    UIStoryboard *educatorsStoryboard = [UIStoryboard storyboardWithName:@"EducatorsSurveys" bundle:nil];
    UIViewController *initialEducatorsVC = [educatorsStoryboard instantiateInitialViewController];
    initialEducatorsVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:initialEducatorsVC animated:YES];
}

-(void)goToCompletedSurveys{
    UIStoryboard *completedStoryboard = [UIStoryboard storyboardWithName:@"CompletedSurveys" bundle:nil];
    UIViewController *initialCompletedVC = [completedStoryboard instantiateInitialViewController];
    initialCompletedVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:initialCompletedVC animated:YES];
}


- (void)viewDidLoad
{
    _pinField.keyboardType = UIKeyboardTypeNumberPad;
    [super viewDidLoad];
    UIColor * circleColorPattern = [UIColor colorWithPatternImage: [UIImage imageNamed:@"bg.jpg"]];
    [self.view setBackgroundColor:circleColorPattern];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
