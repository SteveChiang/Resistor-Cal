//
//  PickerItemView.h
//  Resistor Cal
//
//  Created by Steve Chiang on 13/4/19.
//  Copyright (c) 2013年 Steve Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    ColorBlack = 0,
    ColorBrown,
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
}Color;

@interface PickerItemView : UIView
@property(nonatomic, retain) IBOutlet UIView *mColorView;
@property(nonatomic, retain) IBOutlet UILabel *mShowTxt;
-(void)setColor:(Color)color;
-(Color)getColor;
@end
