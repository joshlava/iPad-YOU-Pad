//
//  ViewController.m
//  radio
//
//  Created by Admin on 23/09/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize radiobutton1;
@synthesize radiobutton2;
@synthesize radiobutton3;
@synthesize question1;
@synthesize submit;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    currentQuestion = 0;
    //initialize answers array
    for(int i = 0; i < 40; i++){
        answers[i] = -1;
    }
    
    fm = [NSFileManager defaultManager];
    [textView setText:@"Press the Button!"];
    
    //create the filepath
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docDir = [paths objectAtIndex:0];
    filePath = [docDir stringByAppendingPathComponent:@"answers.txt"]; 
    //create the answer file
    [fm createFileAtPath:filePath contents:nil attributes:nil];
    
    
    [super viewDidLoad];
    
    [radiobutton1 setBackgroundImage:[UIImage imageNamed:@"button (1).png"] forState:UIControlStateSelected];
    radiobutton1.tag=0;
    [radiobutton1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [radiobutton2 setBackgroundImage:[UIImage imageNamed:@"button (1).png"] forState:UIControlStateSelected];
    radiobutton2.tag=1;
    [radiobutton2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [radiobutton3 setBackgroundImage:[UIImage imageNamed:@"button (1).png"] forState:UIControlStateSelected];
    radiobutton3.tag=2;
    [radiobutton3 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}


//event handler for recording answer when an answer button is selected.
-(IBAction)answer:(id)sender
{
    UIButton *button = (UIButton *)sender;
    NSString *buttonTitle = button.currentTitle;
    
    if([buttonTitle isEqualToString:@"Yes"]){
        NSLog(@"YES!");
        answers[button.tag / 100] = 1;
    } else if([buttonTitle isEqualToString:@"No"]){
        NSLog(@"NO!");
        answers[button.tag / 100] = 0;
    } else if([buttonTitle isEqualToString:@"Maybe"]){
        NSLog(@"MAYBE!");
        answers[button.tag / 100] = 2;
    } else if([buttonTitle isEqualToString:@"I don't know"]){
        NSLog(@"I DON'T KNOW!");
        answers[button.tag / 100] = 3;
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



- (void)buttonClicked:(UIButton *)sender {
    switch (sender.tag % 100)
    {
        case 0:
            if([radiobutton1 isSelected]==YES) {
                [radiobutton1 setSelected:YES];
            } else {
                [radiobutton1 setSelected:YES];
                [radiobutton2 setSelected:NO];
                [radiobutton3 setSelected:NO];
            }
            
            break;
            
        case 1:
            if([radiobutton2 isSelected]==YES) {
                [radiobutton2 setSelected:YES];
            } else {
                [radiobutton2 setSelected:YES];
                [radiobutton1 setSelected:NO];
                [radiobutton3 setSelected:NO];
            }
            
            break;
            
        case 2:
            if([radiobutton3 isSelected]==YES) {
                [radiobutton3 setSelected:YES];
            } else {
                [radiobutton3 setSelected:YES];
                [radiobutton2 setSelected:NO];
                [radiobutton1 setSelected:NO];
            }
            
            break;
            
    }
}








- (void)viewDidUnload
{
    [self setRadiobutton1:nil];
    [self setRadiobutton2:nil];
    [self setRadiobutton3:nil];
    [self setQuestion1:nil];
    [self setSubmit:nil];
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

- (IBAction)radioButtonClicked:(id)sender {
}
@end
