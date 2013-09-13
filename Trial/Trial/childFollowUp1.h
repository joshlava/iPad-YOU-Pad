//
//  childFollowUp1.h
//  Trial
//
//  Created by Yuki Robson on 11/09/13.
//  Copyright (c) 2013 Yuki Robson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface childFollowUp1 : UIViewController
{
    int checkBox1[3];
}

@property (weak, nonatomic) IBOutlet UIButton *nextButton;
- (IBAction)checkNextButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *checkbox100;
- (IBAction)checkboxAction100:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *checkbox110;
- (IBAction)checkboxAction110:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *checkbox111;
- (IBAction)checkboxAction111:(id)sender;



@end
