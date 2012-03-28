//
//  FlashButton.h
//  Flash!
//
//  Created by Anton Eskildsen on 26/03/12.
//  Copyright (c) 2012 Erik's Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlashButton : UIButton {
    UIColor *color;
    BOOL state;
}

@property (strong, nonatomic) UIColor *color;
@property (assign) BOOL state;

@end
