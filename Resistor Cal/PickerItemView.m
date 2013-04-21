//
//  PickerItemView.m
//  Resistor Cal
//
//  Created by Steve Chiang on 13/4/19.
//  Copyright (c) 2013年 Steve Chiang. All rights reserved.
//

#import "PickerItemView.h"
@interface PickerItemView () {
    Color mCurrentColor;
}
-(CGFloat)transferColor:(CGFloat)degree;
@end
@implementation PickerItemView
@synthesize mColorView;
@synthesize mShowTxt;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)dealloc {
    [mColorView release];
    [mShowTxt release];
    [super dealloc];
}
/*
 
 ColorBrown = 1,
 ColorRed,
 ColorOrange,
 ColorYellow,
 ColorGreen,
 ColorBlue,
 ColorPurple,
 ColorGray,
 ColorWhite,
 ColorGold,
 ColorSilver,
 ColorClear,

 */
#pragma mark - public
-(void)setColor:(Color)color {
    switch (color) {
        case ColorBlack:
            [mShowTxt setText:@"黑"];
            [mColorView setBackgroundColor:[UIColor blackColor]];
            break;
        case ColorBrown:
            [mShowTxt setText:@"棕"];
            [mColorView setBackgroundColor:[UIColor brownColor]];
            break;
        case ColorRed:
            [mShowTxt setText:@"紅"];
            [mColorView setBackgroundColor:[UIColor redColor]];
            break;
        case ColorOrange:
            [mShowTxt setText:@"橙"];
            [mColorView setBackgroundColor:[UIColor orangeColor]];
            break;
        case ColorYellow:
            [mShowTxt setText:@"黃"];
            [mColorView setBackgroundColor:[UIColor yellowColor]];
            break;
        case ColorGreen:
            [mShowTxt setText:@"綠"];
            [mColorView setBackgroundColor:[UIColor greenColor]];
            break;
        case ColorBlue:
            [mShowTxt setText:@"藍"];
            [mColorView setBackgroundColor:[UIColor blueColor]];
            break;
        case ColorPurple:
            [mShowTxt setText:@"紫"];
            [mColorView setBackgroundColor:[UIColor purpleColor]];
            break;
        case ColorGray:
            [mShowTxt setText:@"灰"];
            [mColorView setBackgroundColor:[UIColor grayColor]];
            break;
        case ColorWhite:
            [mShowTxt setText:@"白"];
            [mColorView setBackgroundColor:[UIColor whiteColor]];
            break;
        case ColorGold:
            [mShowTxt setText:@"金"];
            [mColorView setBackgroundColor:[UIColor colorWithRed:[self transferColor:252.0f]
                                                           green:[self transferColor:255.0f]
                                                            blue:[self transferColor:0.0f]
                                                           alpha:1.0f]];
            break;
        case ColorSilver:
            [mShowTxt setText:@"銀"];
            [mColorView setBackgroundColor:[UIColor colorWithRed:[self transferColor:212.0f]
                                                           green:[self transferColor:212.0f]
                                                            blue:[self transferColor:212.0f]
                                                           alpha:1.0f]];
            break;
        default:
            break;
    }
}

-(Color)getColor {
    return mCurrentColor;
}

#pragma mark - private
-(CGFloat)transferColor:(CGFloat)degree {
    return degree/255.0f;
}

@end
