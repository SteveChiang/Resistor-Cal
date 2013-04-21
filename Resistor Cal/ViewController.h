//
//  ViewController.h
//  Resistor Cal
//
//  Created by Steve Chiang on 13/4/21.
//  Copyright (c) 2013年 Steve Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property(nonatomic, retain) IBOutlet UILabel *mDisplayValue;
@property(nonatomic, retain) IBOutlet UIPickerView *mAdjPicker;
@end
