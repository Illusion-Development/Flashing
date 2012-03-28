//
//  FlashButton.m
//  Flash!
//
//  Created by Anton Eskildsen on 26/03/12.
//  Copyright (c) 2012 Erik's Team. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "FlashButton.h"

@implementation FlashButton

@synthesize color, state;

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        color = [UIColor whiteColor];
//    }
//    return self;
//}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        color = [UIColor whiteColor];
        
        CGImageRef backgroundImage = [UIImage imageNamed:@"button_background.png"].CGImage;
        CGImageRef offImage = [UIImage imageNamed:@"button_icon_off.png"].CGImage;
        CGImageRef onImage = [UIImage imageNamed:@"button_icon_on.png"].CGImage;
        
        CALayer *backgroundLayer = [CALayer layer];
        backgroundLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        backgroundLayer.bounds = self.bounds;
        backgroundLayer.contents = (__bridge_transfer id)backgroundImage;
        backgroundLayer.shadowPath = CGPathCreateWithEllipseInRect(self.bounds, 0);
        UIColor __weak *bcolor = [UIColor blackColor];
        backgroundLayer.shadowColor = bcolor.CGColor; 
        backgroundLayer.shadowRadius = 10;
        backgroundLayer.shadowOpacity = 1;
        
        CALayer *offLayer = [CALayer layer];
        offLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        offLayer.bounds = self.bounds;
        offLayer.contents = (__bridge_transfer id)offImage;
        
        CALayer *onLayer = [CALayer layer];
        onLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        onLayer.bounds = self.bounds;
        onLayer.contents = (__bridge_transfer id)onImage;
        onLayer.opacity = 0;
        
        [self.layer addSublayer:backgroundLayer];
        [self.layer addSublayer:offLayer];
        [self.layer addSublayer:onLayer];
    }
    return self;
}

//- (void)drawRect:(CGRect)rect
//{
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    
//    CGContextTranslateCTM(context, rect.size.width/2, rect.size.height/2);
//    CGContextRotateCTM(context, M_PI);
//    CGContextTranslateCTM(context, -rect.size.width/2, -rect.size.height/2);
//    
//    CGContextDrawImage(context, rect, [UIImage imageNamed:@"button_background.png"].CGImage);
//    if (state) {
//        CGContextDrawImage(context, rect, onImage);
//    }
//    else {
//        CGContextDrawImage(context, rect, offImage);
//    }
//}


@end
