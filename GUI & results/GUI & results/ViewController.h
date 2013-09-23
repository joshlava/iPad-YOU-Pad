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
    int currentQuestion;
}

@property (weak, nonatomic) IBOutlet UIButton *radiobutton1;
@property (weak, nonatomic) IBOutlet UIButton *radiobutton2;
@property (weak, nonatomic) IBOutlet UIButton *radiobutton3;
@property (weak, nonatomic) IBOutlet UILabel *question1;
@property (weak, nonatomic) IBOutlet UIButton *submit;

- (IBAction)radioButtonClicked:(id)sender;
- (IBAction)answer:(id)sender;
- (IBAction)submit:(id)sender;

@end
