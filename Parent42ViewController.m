//
//  Parent42ViewController.m
//  iPad-YOU-Pad
//
//  Created by Yuki Robson on 3/10/13.
//  Copyright (c) 2013 Andrew Edwards. All rights reserved.
//

#import "Parent42ViewController.h"
#import "parentMenuViewController.h"

int checkBox2[8];
bool firstStartup[8];
int page;
int questions;

@interface Parent42ViewController ()

@end

@implementation Parent42ViewController

@synthesize nextButton;

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
    questions = 8;
    page = 1;
    nextButton.enabled = NO;
    nextButton.alpha = 0.3;
    NSLog(@"hi1");
    if(firstStartup[page])
    {
        firstStartup[page] = FALSE;
        for(int i = 0; i < questions; i++) {
            checkBox2[i] = 0;
        }
    }
    
    for(int i = 0; i < 10000; i+=100){
        for(int j = 1; j < 4; j++){
            UIButton * temp = (UIButton *)[self.view viewWithTag:(i+j)];
            [temp setBackgroundImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:UIControlStateSelected];
            [temp addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    //check if already answered checkBox
    for(int i = 0; i < questions; i++)
    {
        if(checkBox2[i] != 0)
        {
            int temp = checkBox2[i]+((i+1)*100); //get correct checkbox tag
            UIButton *tempButton = (UIButton *)[self.view viewWithTag:(temp)];
            [tempButton setBackgroundImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:UIControlStateSelected];
            [tempButton setSelected:YES];
            
        }
    }
    [self checkNextButton];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)checkNextButton {
    
    BOOL flag = YES;
    for(int i = 0; i < questions; i+=1)
    {
        if(checkBox2[i] <=0)
        {
            flag = NO;
        }
        
    }
    if(flag) {
        nextButton.enabled = YES;
        nextButton.alpha = 1;
    }
    
    //NSLog(@"%f", 2.0);
}

-(IBAction)nextButton:(id)sender {
    //write to file
    for(int i = 0; i < questions; i++)
    {
        NSLog(@"%d",checkBox2[i]);
    }
    
}


- (void)buttonClicked:(UIButton *)sender {
    UIButton *button = (UIButton *)sender;
    
    if([button isSelected]==YES) {
        [button setSelected:YES];
    } else {
        int checkBoxRow = button.tag/100 - 1;
        checkBox2[checkBoxRow] = button.tag%100;
        int round = ((button.tag / 100) * 100) + 1;
        for(int i = round; i < (round + 3); i++){
            UIButton * temp = (UIButton *)[self.view viewWithTag:i];
            [temp setSelected:NO];
        }
        [button setSelected:YES];
        
    }
    [self checkNextButton];
}


@end
