//
//  childFollowUp1.m
//  Trial
//
//  Created by Yuki Robson on 11/09/13.
//  Copyright (c) 2013 Yuki Robson. All rights reserved.
//

#import "childFollowUp1.h"

@interface childFollowUp1 ()

@end

@implementation childFollowUp1

@synthesize checkbox100;
@synthesize checkbox110;
@synthesize checkbox111;

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    checkBox1[0] = -1;
    checkBox1[1] = -1;
    checkBox1[2] = -1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)checkNextButton:(id)sender{
    
}

- (IBAction)checkboxAction100:(id)sender {
    [checkbox100 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    [checkbox110 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox111 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    checkBox1[0] = 1;
    //[self checkNextButton];
    //nextButton.enabled = YES;
    
}
- (IBAction)checkboxAction110:(id)sender {
    [checkbox100 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox110 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    [checkbox111 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    checkBox1[0] = 2;
    //[self checkNextButton];
    
}
- (IBAction)checkboxAction111:(id)sender {
    [checkbox100 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox110 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox111 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    checkBox1[0] = 3;
    //[self checkNextButton];
}

@end
