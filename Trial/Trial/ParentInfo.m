//
//  ParentInfo.m
//  Trial
//
//  Created by Yuki Robson on 24/09/13.
//  Copyright (c) 2013 Yuki Robson. All rights reserved.
//

#import "ParentInfo.h"
#import "ChooseSurvey.h"

@interface ParentInfo ()

@end

@implementation ParentInfo


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
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber *surveyNumber = nil;
    if(standardUserDefaults) {
        surveyNumber = [standardUserDefaults objectForKey:@"survey"];
        NSLog(@"secondview %@",surveyNumber);
    }
    [super viewDidLoad];
    //_scene2.text = _survey;
    //NSLog(@"secondview %@",_survey);
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
