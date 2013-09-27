//
//  AppDelegate.h
//  GUI & results
//
//  Created by Admin on 23/09/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    NSFileManager *fm;
    NSArray *paths;
    NSString *docDir;
    NSString *filePath;
}

@property (strong, nonatomic) UIWindow *window;

@end
