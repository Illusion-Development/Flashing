//
//  FlashAppDelegate.m
//  Flash!
//
//  Created by Anton Eskildsen on 25/03/12.
//  Copyright (c) 2012 Erik's Team. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>

#import "FlashAppDelegate.h"
#import "FlashViewController.h"
#import "FlashButton.h"

@implementation FlashAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[FlashViewController alloc] initWithNibName:@"FlashViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
//    AVCaptureDevice *backCamera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
//    if ( [backCamera isTorchAvailable] && [backCamera isTorchModeSupported:AVCaptureTorchModeOn]  )
//    {
//        BOOL success = [backCamera lockForConfiguration:nil];
//        if ( success )
//        {
//            [backCamera setTorchMode:AVCaptureTorchModeOff];
//            [backCamera unlockForConfiguration];
//        }
//    }
    ((FlashButton *)_viewController.view.subviews.lastObject).state = YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    _viewController.view.hidden = YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    AVCaptureDevice *backCamera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ( [backCamera isTorchAvailable] && [backCamera isTorchModeSupported:AVCaptureTorchModeOn]  )
    {
        BOOL success = [backCamera lockForConfiguration:nil];
        if ( success )
        {
            [backCamera setTorchMode:AVCaptureTorchModeOn];
            [backCamera unlockForConfiguration];
        }
    }
    if (((FlashButton *)_viewController.view.subviews.lastObject).state == YES) {
        ((CALayer *)((FlashButton *)_viewController.view.subviews.lastObject).layer.sublayers.lastObject).opacity = 1;
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end