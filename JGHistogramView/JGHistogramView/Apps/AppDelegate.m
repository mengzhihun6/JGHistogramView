//
//  AppDelegate.m
//  JGHistogramView
//
//  Created by spring on 2020/7/3.
//  Copyright © 2020 spring. All rights reserved.
//

#import "AppDelegate.h"
#import "JGRootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
        self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[JGRootViewController alloc] init]];

    [self.window makeKeyAndVisible];

    
    
    return YES;
}





@end
