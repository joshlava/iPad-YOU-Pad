//
//  ViewController.m
//
//
//  Created by Andrew Edwards on 23/09/13.
//  Copyright (c) 2013 Computer Science Student @ UWA. All rights reserved.
//

#import "ViewController.h"

BOOL runOnce = true;
int answers[40];
int selected[40];
NSFileManager *fm;
NSArray *paths;
NSString *docDir;
NSString *filePath;

@implementation ViewController

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
    } else if([buttonTitle isEqualToString:@"I don't know"]){
        NSLog(@"I DON'T KNOW!");
        answers[button.tag / 100] = 3;
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
