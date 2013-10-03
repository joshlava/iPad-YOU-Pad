//
//  ViewController.m
//
//
//  Created by Andrew Edwards on 23/09/13.
//  Copyright (c) 2013 Computer Science Student @ UWA. All rights reserved.
//

#import "KidsSurveysViewController.h"

BOOL runOnce = true;
BOOL s1117ImpactSupplement = false;
BOOL s1117FollowUp = false;
int answers[40];
int selected[40];
NSFileManager *fm;
NSArray *paths;
NSString *docDir;
NSString *filePath;

@implementation KidsSurveysViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    if(runOnce){
        //initialize answers array
        for(int i = 0; i < 40; i++){
            answers[i] = -1;
            selected[i] = -1;
        }
        
        fm = [NSFileManager defaultManager];
        [textView setText:@"Press the Button!"];
        
        //create the filepath
        paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        docDir = [paths objectAtIndex:0];
        filePath = [docDir stringByAppendingPathComponent:@"answers.txt"];
        //create the answer file
        [fm createFileAtPath:filePath contents:nil attributes:nil];
        NSLog(@"file created at: %@",docDir);
        
        runOnce = false;
    }
    
    //for every possible answer button, set the background to be changed to green when state is changed to selected
    for(int i = 0; i < 10000; i+=100){
        for(int j = 1; j < 5; j++){
            UIButton * temp = (UIButton *)[self.view viewWithTag:(i+j)];
            [temp setBackgroundImage:[UIImage imageNamed:@"button (1).png"] forState:UIControlStateSelected];
            [temp addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    for(int i = 0; i < 40; i++){
        if(selected[i] != -1){
            UIButton *temp = (UIButton *)[self.view viewWithTag:selected[i]];
            [temp setSelected:YES];
        }
    }
    
    if(s1117ImpactSupplement){
        UIButton *temp = (UIButton *)[self.view viewWithTag:999];
        [temp setTitle:@"Next" forState:UIControlStateNormal];
    }
    
    [firstQuestionNavBar setHidesBackButton:YES];
    [endOfSurvey setHidesBackButton:YES];
    [super viewDidLoad];
}

//event handler for recording answer when an answer button is selected.
-(IBAction)answer:(id)sender
{
    UIButton *button = (UIButton *)sender;
    NSString *buttonTitle = button.currentTitle;
    
    if([buttonTitle isEqualToString:@"Somewhat True"]){
        NSLog(@"Somewhat True!");
        answers[button.tag / 100] = 1;
        selected[button.tag / 100] = button.tag;
    } else if([buttonTitle isEqualToString:@"Not True"]){
        NSLog(@"Not True!");
        answers[button.tag / 100] = 0;
        selected[button.tag / 100] = button.tag;
    } else if([buttonTitle isEqualToString:@"Certaintly True"]){
        NSLog(@"Certaintly True!");
        answers[button.tag / 100] = 2;
        selected[button.tag / 100] = button.tag;
    }  else if([buttonTitle isEqualToString:@"No - No difficulties"]){
        NSLog(@"No - No difficulties!");
        answers[button.tag / 100] = 10;
        selected[button.tag / 100] = button.tag;
    } else if([buttonTitle isEqualToString:@"Yes - Minor difficulties"]){
        NSLog(@"Yes - Minor difficulties!");
        answers[button.tag / 100] = 11;
        selected[button.tag / 100] = button.tag;
    } else if([buttonTitle isEqualToString:@"Yes - Definite difficulties"]){
        NSLog(@"Yes - Definite difficulties");
        answers[button.tag / 100] = 12;
        selected[button.tag / 100] = button.tag;
    } else if([buttonTitle isEqualToString:@"Yes - Severe difficulties"]){
        NSLog(@"Yes - Severe difficulties!");
        answers[button.tag / 100] = 13;
        selected[button.tag / 100] = button.tag;
    } else if([buttonTitle isEqualToString:@"Less than a month"]){
        NSLog(@"Less than a month!");
        answers[button.tag / 100] = 14;
        selected[button.tag / 100] = button.tag;
    } else if([buttonTitle isEqualToString:@"1-5 months"]){
        NSLog(@"1-5 months!");
        answers[button.tag / 100] = 15;
        selected[button.tag / 100] = button.tag;
    } else if([buttonTitle isEqualToString:@"6-12 months"]){
        NSLog(@"6-12 months!");
        answers[button.tag / 100] = 16;
        selected[button.tag / 100] = button.tag;
    } else if([buttonTitle isEqualToString:@"Over a year"]){
        NSLog(@"Over a year!");
        answers[button.tag / 100] = 17;
        selected[button.tag / 100] = button.tag;
    } else if([buttonTitle isEqualToString:@"Not at all"]){
        NSLog(@"Not at all!");
        answers[button.tag / 100] = 20;
        selected[button.tag / 100] = button.tag;
    } else if([buttonTitle isEqualToString:@"Only a little"]){
        NSLog(@"Only a little!");
        answers[button.tag / 100] = 21;
        selected[button.tag / 100] = button.tag;
    } else if([buttonTitle isEqualToString:@"Quite a lot"]){
        NSLog(@"Quite a lot!");
        answers[button.tag / 100] = 22;
        selected[button.tag / 100] = button.tag;
    } else if([buttonTitle isEqualToString:@"A great deal"]){
        NSLog(@"A great deal!");
        answers[button.tag / 100] = 23;
        selected[button.tag / 100] = button.tag;
    }
}

//event handler for when submit button is selected to write results to file.
-(IBAction)submit:(id)sender
{
    if ([fm fileExistsAtPath:filePath]) {
        //create file handle
        NSFileHandle *myHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
        
        if(myHandle == nil){
            exit(0);
            //failed to open file
        }
        
        //concatenate answers into one single string, answerString
        NSMutableString *answerString = [NSMutableString string];
        int i = 0;
        while(answers[i] != -1){
            [answerString appendString:[NSString stringWithFormat:@"%d, ", answers[i]]];
            i++;
        }
        
        //write the answers to file
        NSData *theData = [answerString dataUsingEncoding:NSUTF8StringEncoding];
        [myHandle seekToEndOfFile];
        [myHandle writeData:theData];
        [myHandle closeFile];
        
        //display file contents on screen
        [textView setText:[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil]];
    }
}

//Handler to continue with impact supplement questions if yes is answered to question re: difficulties
- (IBAction)childDifficultiesNext:(id)sender {
    UIButton *yesMinor = (UIButton *)[self.view viewWithTag:2502];
    UIButton *yesDefinite = (UIButton *)[self.view viewWithTag:2503];
    UIButton *yesSevere = (UIButton *)[self.view viewWithTag:2504];
    UIButton *noDifficulties = (UIButton *)[self.view viewWithTag:2501];

    if([yesMinor isSelected]==YES || [yesDefinite isSelected]==YES || [yesSevere isSelected]==YES){
        [self performSegueWithIdentifier:@"yesDifficulties" sender:self];
    } else if([noDifficulties isSelected]==YES){
        [self performSegueWithIdentifier:@"noDifficulties" sender:self];
    }
}

//Handler to make sure the impact supp module is loaded when impact supp survey selected
- (IBAction)s1117ImpactSuppButtonPress:(id)sender {
    s1117ImpactSupplement = true;
}

//handler to make impact supp questions visible
- (IBAction)impactSuppNext:(id)sender {
    
    if(s1117ImpactSupplement){
        [self performSegueWithIdentifier:@"yesImpactSupp" sender:self];
    } else {
        [self performSegueWithIdentifier:@"noImpactSupp" sender:self];

    }
}

- (IBAction)s1117FollowUpButtonPress:(id)sender{
    s1117FollowUp = true;
}

- (IBAction)followUpNext:(id)sender{
    if(s1117FollowUp){
        [self performSegueWithIdentifier:@"yesImpactSupp" sender:self];
    }
}

//event handler for when answer button is pressed only highlights the latest selected answer button.
- (void)buttonClicked:(UIButton *)sender {
    UIButton *button = (UIButton *)sender;
    
    if([button isSelected]==YES) {
        [button setSelected:YES];
    } else {
        int round = ((button.tag / 100) * 100) + 1;
        for(int i = round; i < (round + 5); i++){
            UIButton * temp = (UIButton *)[self.view viewWithTag:i];
            [temp setSelected:NO];
        }
        [button setSelected:YES];
        
    }
    [self answer:sender];
}

- (void)goToMainMenu{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}
@end
