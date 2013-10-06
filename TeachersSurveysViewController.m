//
//  ParetnsSurveysViewController.m
//  iPad-YOU-Pad
//
//  Created by Andrew Edwards on 3/10/13.
//  Copyright (c) 2013 Andrew Edwards. All rights reserved.
//

#import "TeachersSurveysViewController.h"

@interface ParentsSurveysViewController ()

@end

@implementation ParentsSurveysViewController

@synthesize nextButton;

@synthesize checkbox100;
@synthesize checkbox110;
@synthesize checkbox111;

@synthesize checkbox200;
@synthesize checkbox220;
@synthesize checkbox222;

@synthesize checkbox300;
@synthesize checkbox330;
@synthesize checkbox333;

@synthesize checkbox400;
@synthesize checkbox440;
@synthesize checkbox444;

@synthesize checkbox500;
@synthesize checkbox550;
@synthesize checkbox555;

@synthesize checkbox600;
@synthesize checkbox660; 
@synthesize checkbox666;

@synthesize checkbox700;
@synthesize checkbox770;
@synthesize checkbox777;

@synthesize checkbox800;
@synthesize checkbox880;
@synthesize checkbox888;


- (void)goToMainMenu{
    [self dismissModalViewControllerAnimated:YES];
}

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
    nextButton.enabled = NO;
    nextButton.alpha = 0.2;
    //change location of this
    checkBox[0] = -1;
    checkBox[1] = -1;
    checkBox[2] = -1;
    checkBox[3] = -1;
    checkBox[4] = -1;
    checkBox[5] = -1;
    checkBox[6] = -1;
    checkBox[7] = -1;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)checkNextButton {
    
    BOOL flag = NO;
    for(int i = 0; i < 8; i++)
    {
        if(checkBox[i] == -1){
            flag = YES;
        }
    }
    if(!flag) {
        nextButton.enabled = YES;
        nextButton.alpha = 1;
    }
    
    //NSLog(@"%f", 2.0);
}

-(IBAction)nextButton:(id)sender {
    ////global
    NSInteger answers[8];
    for(int i = 0; i < 8; i++)
    {
        answers[i] = checkBox[i];
    }
    /*trialAppDelegate *appDel = [[UIApplication sharedApplication]delegate];
    appDel.survey1 = [NSMutableArray array];
    
    [appDel.survey1 addObject:[NSNumber numberWithInt:answers[0]]];
    [appDel.survey1 addObject:[NSNumber numberWithInt:answers[1]]];
    [appDel.survey1 addObject:[NSNumber numberWithInt:answers[2]]];
    [appDel.survey1 addObject:[NSNumber numberWithInt:answers[3]]];
    [appDel.survey1 addObject:[NSNumber numberWithInt:answers[4]]];
    [appDel.survey1 addObject:[NSNumber numberWithInt:answers[5]]];
    [appDel.survey1 addObject:[NSNumber numberWithInt:answers[6]]];
    [appDel.survey1 addObject:[NSNumber numberWithInt:answers[7]]];
    NSLog(@" %@",appDel.survey1);*/
}

//set 1
- (IBAction)checkboxAction100:(id)sender {
    [checkbox100 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    [checkbox110 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox111 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    checkBox[0] = 1;
    [self checkNextButton];
    
    
}
- (IBAction)checkboxAction110:(id)sender {
    [checkbox100 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox110 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    [checkbox111 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    checkBox[0] = 2;
    [self checkNextButton];
    
}
- (IBAction)checkboxAction111:(id)sender {
    [checkbox100 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox110 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox111 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    checkBox[0] = 3;
    [self checkNextButton];
}


//set 2

- (IBAction)checkboxAction200:(id)sender {
    [checkbox200 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    [checkbox220 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox222 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    checkBox[1] = 1;
    [self checkNextButton];
    
}
- (IBAction)checkboxAction220:(id)sender {
    [checkbox200 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox220 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    [checkbox222 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    checkBox[1] = 2;
    [self checkNextButton];
    
}
- (IBAction)checkboxAction222:(id)sender {
    [checkbox200 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox220 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox222 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    checkBox[1] = 3;
    [self checkNextButton];
}


//set 3
- (IBAction)checkboxAction300:(id)sender {
    [checkbox300 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    [checkbox330 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox333 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    checkBox[2] = 1;
    [self checkNextButton];
    
}
- (IBAction)checkboxAction330:(id)sender {
    [checkbox300 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox330 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    [checkbox333 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    checkBox[2] = 2;
    [self checkNextButton];
    
}
- (IBAction)checkboxAction333:(id)sender {
    [checkbox300 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox330 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox333 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    checkBox[2] = 3;
    [self checkNextButton];
}

//set4

- (IBAction)checkboxAction400:(id)sender {
    [checkbox400 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    [checkbox440 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox444 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    checkBox[3] = 1;
    [self checkNextButton];
    
}
- (IBAction)checkboxAction440:(id)sender {
    [checkbox400 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox440 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    [checkbox444 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    checkBox[3] = 2;
    [self checkNextButton];
    
}
- (IBAction)checkboxAction444:(id)sender {
    [checkbox400 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox440 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox444 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    checkBox[3] = 3;
    [self checkNextButton];
}

//set 5

- (IBAction)checkboxAction500:(id)sender {
    [checkbox500 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    [checkbox550 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox555 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    checkBox[4] = 1;
    [self checkNextButton];
    
}
- (IBAction)checkboxAction550:(id)sender {
    [checkbox500 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox550 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    [checkbox555 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    checkBox[4] = 2;
    [self checkNextButton];
    
}
- (IBAction)checkboxAction555:(id)sender {
    [checkbox500 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox550 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox555 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    checkBox[4] = 3;
    [self checkNextButton];
    
}
//set 6

- (IBAction)checkboxAction600:(id)sender {
    [checkbox600 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    [checkbox660 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox666 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    checkBox[5] = 1;
    [self checkNextButton];
    
}
- (IBAction)checkboxAction660:(id)sender {
    [checkbox600 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox660 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    [checkbox666 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    checkBox[5] = 2;
    [self checkNextButton];
    
}
- (IBAction)checkboxAction666:(id)sender {
    [checkbox600 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox660 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox666 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    checkBox[5] = 3;
    [self checkNextButton];
}

- (IBAction)checkboxAction700:(id)sender {
    [checkbox700 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    [checkbox770 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox777 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    checkBox[6] = 1;
    [self checkNextButton];
    
}
- (IBAction)checkboxAction770:(id)sender {
    [checkbox700 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox770 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    [checkbox777 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    checkBox[6] = 2;
    [self checkNextButton];
    
}
- (IBAction)checkboxAction777:(id)sender {
    [checkbox700 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox770 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox777 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    checkBox[6] = 3;
    [self checkNextButton];
}

- (IBAction)checkboxAction800:(id)sender {
    [checkbox800 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    [checkbox880 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox888 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    checkBox[7] = 1;
    [self checkNextButton];
    
}
- (IBAction)checkboxAction880:(id)sender {
    [checkbox800 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox880 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    [checkbox888 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    checkBox[7] = 2;
    [self checkNextButton];
    
}
- (IBAction)checkboxAction888:(id)sender {
    [checkbox800 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox880 setImage:[UIImage imageNamed:@"Very-Basic-Unchecked-checkbox-icon.png"] forState:normal];
    [checkbox888 setImage:[UIImage imageNamed:@"Very-Basic-Checked-checkbox-icon.png"] forState:normal];
    checkBox[7] = 3;
    [self checkNextButton];
}

@end
