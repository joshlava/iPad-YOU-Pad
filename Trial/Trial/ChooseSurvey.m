//
//  ChooseSurvey.m
//  Trial
//
//  Created by Yuki Robson on 24/09/13.
//  Copyright (c) 2013 Yuki Robson. All rights reserved.
//

#import "ChooseSurvey.h"
#import "ParentInfo.h"
#import "trialViewController.h"

@interface ChooseSurvey ()

@end

@implementation ChooseSurvey

@synthesize survey1;
@synthesize survey2;
@synthesize survey3;

@synthesize survey4;
@synthesize survey5;
@synthesize survey6;

@synthesize survey7;
@synthesize survey8;
@synthesize survey9;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    //NSLog(@"global %d",myglobal);
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

void SetGlobal(int value)
{
    int surveyNumber = value;
    
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    /*NSInteger survey1[8] = [[[NSUserDefaults standardUserDefaults]objectForKey:@"survey1"]integerValue];
    for(int i = 0; i < 8; i++)
    {
        survey1[i] = 0;
    }*/
    if(standardUserDefaults){
        [standardUserDefaults setObject:[NSNumber numberWithInt:surveyNumber] forKey:@"survey"];
        //[standardUserDefaults setObject:survey1 forKey:@"survey1"];
        [standardUserDefaults synchronize];
    }
    
    
    
    
}

- (IBAction)survey1:(id)sender{
    SetGlobal(1);
}

- (IBAction)survey2:(id)sender{
    SetGlobal(2);
}

- (IBAction)survey3:(id)sender{
    SetGlobal(3);
}

- (IBAction)survey4:(id)sender{
    //used to set global variable
    //end of global var edit
    SetGlobal(4);
    //[self performSegueWithIdentifier:_Survey sender:self];

}

- (IBAction)survey5:(id)sender{
    SetGlobal(5);
}

- (IBAction)survey6:(id)sender{
    SetGlobal(6);
}


- (IBAction)survey7:(id)sender{
    SetGlobal(7);
}

- (IBAction)survey8:(id)sender{
    SetGlobal(8);
}

- (IBAction)survey9:(id)sender{
    SetGlobal(9);
}

/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ParentInfo *destination = [segue destinationViewController];
    _Survey = @"hi";
    destination.survey = _Survey;
}*/
@end
