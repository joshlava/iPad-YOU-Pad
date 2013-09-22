//
//  ViewController.h
//  result_saver
//
//  Created by Admin on 13/09/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    IBOutlet UITextView *textView;
    NSFileManager *fm;
    NSArray *paths;
    NSString *docDir;
    NSString *filePath;
    int answers[40];
}

-(IBAction)answer:(id)sender;
-(IBAction)submit:(id)sender;

/*-(IBAction)q1Yes:(id)sender;
-(IBAction)q1No:(id)sender;
-(IBAction)q1Maybe:(id)sender;
-(IBAction)q1IDK:(id)sender;
-(IBAction)q2Yes:(id)sender;
-(IBAction)q2No:(id)sender;
-(IBAction)q2Maybe:(id)sender;
-(IBAction)q2IDK:(id)sender;*/

@end
