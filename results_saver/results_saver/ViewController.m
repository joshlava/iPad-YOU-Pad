//
//  ViewController.m
//  result_saver
//
//  Created by Admin on 13/09/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
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
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

//event handler for recording answer when an answer button is selected.
-(IBAction)answer:(id)sender
{
    UIButton *button = (UIButton *)sender;
    NSString *buttonTitle = button.currentTitle;
        
    if([buttonTitle isEqualToString:@"Yes"]){
        NSLog(@"YES!");
        answers[button.tag] = 1;
    } else if([buttonTitle isEqualToString:@"No"]){
        NSLog(@"NO!");
        answers[button.tag] = 0;
    } else if([buttonTitle isEqualToString:@"Maybe"]){
        NSLog(@"MAYBE!");
        answers[button.tag] = 2;
    } else if([buttonTitle isEqualToString:@"I don't know"]){
        NSLog(@"I DON'T KNOW!");
        answers[button.tag] = 3;
    }
    
    NSLog(@"index %d: %d", button.tag, answers[button.tag]);
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
