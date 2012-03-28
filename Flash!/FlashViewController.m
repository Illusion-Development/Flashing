//
//  FlashViewController.m
//  Flash!
//
//  Created by Anton Eskildsen on 25/03/12.
//  Copyright (c) 2012 Erik's Team. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

#import "FlashViewController.h"
#import "FlashButton.h"

@interface FlashViewController ()

@end

@implementation FlashViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    ((CALayer *)((FlashButton *)self.view.subviews.lastObject).layer.sublayers.lastObject).opacity = 1; 
    ((FlashButton *)self.view.subviews.lastObject).state = YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation == UIInterfaceOrientationPortrait)
        return YES;
    
    return NO;
}

- (IBAction)toggleFlash:(id)sender {
    FlashButton *button = (FlashButton *)sender;
    CALayer *layer = [button.layer.sublayers objectAtIndex:3];
    
    if (!button.state) {
        button.color = [UIColor blueColor];
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
        button.state = YES;
        layer.opacity = 1;
    }
    else {
        button.color = [UIColor whiteColor];
        AVCaptureDevice *backCamera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ( [backCamera isTorchAvailable] && [backCamera isTorchModeSupported:AVCaptureTorchModeOn]  )
        {
            BOOL success = [backCamera lockForConfiguration:nil];
            if ( success )
            {
                [backCamera setTorchMode:AVCaptureTorchModeOff];
                [backCamera unlockForConfiguration];
            }
        }
        button.state = NO;
        layer.opacity = 0;
    }
    [button setNeedsDisplay];
}

@end
