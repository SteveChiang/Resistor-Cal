//
//  ViewController.m
//  Resistor Cal
//
//  Created by Steve Chiang on 13/4/21.
//  Copyright (c) 2013年 Steve Chiang. All rights reserved.
//

#import "ViewController.h"
#import "PickerItemView.h"
@interface ViewController ()
-(NSString*)calculateOhmByTen:(NSInteger)ten andOne:(NSInteger)one forPow:(NSInteger)pow andPms:(NSInteger)pms;
@end

@implementation ViewController
@synthesize mDisplayValue;
@synthesize mAdjPicker;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc {
    [mDisplayValue release];
    [mAdjPicker release];
    [super dealloc];
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 4;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSInteger result = 10;
    if (component == 3) {
        result = 2;
    }
    return result;
}

#pragma mark - UIPickerViewDelegate
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    PickerItemView *v = (PickerItemView *)view;
    
    if (v == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PickerItemView" owner:self options:nil];
        v = (PickerItemView*)[nib objectAtIndex:0];
    }
    
    if (component == 3) {
        row +=10;
    }
    
    [v setColor:row];
    return v;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [mDisplayValue setText:[self calculateOhmByTen:[pickerView selectedRowInComponent:0]
                                            andOne:[pickerView selectedRowInComponent:1]
                                            forPow:[pickerView selectedRowInComponent:2]
                                            andPms:[pickerView selectedRowInComponent:3]]];
    
}

#pragma mark - private
-(NSString*)calculateOhmByTen:(NSInteger)ten andOne:(NSInteger)one forPow:(NSInteger)pow andPms:(NSInteger)pms {
    NSString *resultStr = @"";
    NSString *unitStr = @"";
    NSInteger unit = pow / 3;
    pow = pow % 3;
    float result = (ten*10+one*1)*powf(10, pow);
    if (result / 1000 >= 1) {
        result /= 1000.0f;
        unit+=1;
    }
    
    switch (unit) {
        case 0:
            unitStr = @"";
            break;
        case 1:
            unitStr = @"K";
            break;
        case 2:
            unitStr = @"M";
            break;
        case 3:
            unitStr = @"G";
            break;
        default:
            break;
    }
    
    resultStr = [NSString stringWithFormat:@"%.1lf%@Ω", result, unitStr];
    switch (pms) {
        case 0:
            resultStr = [NSString stringWithFormat:@"%@ ±5％", resultStr];
            break;
        case 1:
            resultStr = [NSString stringWithFormat:@"%@ ±10％", resultStr];
            break;
        default:
            break;
    }
    return resultStr;
}

@end
