//
//  ViewController.h
//  radio
//
//  Created by Admin on 23/09/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UITextView *textView;
    NSFileManager *fm;
    NSArray *paths;
    NSString *docDir;
    NSString *filePath;
    int answers[40];
}


@property (weak, nonatomic) IBOutlet UILabel *question1;
@property (weak, nonatomic) IBOutlet UILabel *question2;
@property (weak, nonatomic) IBOutlet UILabel *question3;
@property (weak, nonatomic) IBOutlet UIButton *submit;
@property (weak, nonatomic) IBOutlet UIButton *q1a1;
@property (weak, nonatomic) IBOutlet UIButton *q1a2;
@property (weak, nonatomic) IBOutlet UIButton *q1a3;
@property (weak, nonatomic) IBOutlet UIButton *q2a1;
@property (weak, nonatomic) IBOutlet UIButton *q2a2;
@property (weak, nonatomic) IBOutlet UIButton *q2a3;

- (IBAction)answer:(id)sender;
- (IBAction)submit:(id)sender;

@end
