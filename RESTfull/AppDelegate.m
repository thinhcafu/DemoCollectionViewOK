//
//  AppDelegate.m
//  RESTfull
//
//  Created by ECEP2010 on 9/25/15.
//  Copyright (c) 2015 ECEP. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *token = [ud valueForKey:@"token"];
    if (token == nil) {
        // Not logged in --> Load login view
        UIStoryboard *storyboard = self.window.rootViewController.storyboard;
        
         UIViewController *presentedViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self.window setRootViewController:presentedViewController];

        
    }else{
        // else --> Load main view
        UIStoryboard *storyboard = self.window.rootViewController.storyboard;
        
        UIViewController *presentedViewController = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
        [self.window setRootViewController:presentedViewController];
       
    }
    
    
    
    // Override point for customization after application launch.
    // Check point
    //If logged in, load main view
    //Else, load login view
//    NSString *firstViewControllerIdentifier = @"LoginViewController";
//    NSString *secondViewControllerIdentifier = @"MainViewController";
//    
//    // check if the key exists and its value
//    BOOL appHasLaunchedOnce = [[NSUserDefaults standardUserDefaults] boolForKey:@"appHasLaunchedOnce"];
//    NSLog(@"%d",appHasLaunchedOnce);
//    
//    // if the key doesn't exists or its value is NO
//    if (!appHasLaunchedOnce) {
//        // set its values to YES
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"appHasLauchedOnce"];
//        NSLog(@"%d",appHasLaunchedOnce);
//        [[NSUserDefaults standardUserDefaults] synchronize];
//    }
//    
//    // check which view controller identifier should be used
//    NSString *viewControllerIdentifier = appHasLaunchedOnce ? firstViewControllerIdentifier : secondViewControllerIdentifier;
//    // if storyBoard exists in yout info.plist and use a single storyboard
//    UIStoryboard *storyboard = self.window.rootViewController.storyboard;
//    
//    // if the storyboard doesn't exits in your info.plist file or use multiple storyboard
//    // ...
//    
//    // instantiate the view controller
//    UIViewController *presentedViewController = [storyboard instantiateViewControllerWithIdentifier:viewControllerIdentifier];
//    // if don't use a navigation controller
//    //[self.window setRootViewController:presentedViewController];
//    
//    // if use a navigation controller as the entry point in storyboard
//    UINavigationController *navController = (UINavigationController *)self.window.rootViewController;
//    [navController pushViewController:presentedViewController  animated:NO];

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
