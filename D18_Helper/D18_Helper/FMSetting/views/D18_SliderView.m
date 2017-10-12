//
//  D18_SliderView.m
//  D18_Helper
//
//  Created by azz on 2017/10/12.
//  Copyright © 2017年 com.JH.TD. All rights reserved.
//

#import "D18_SliderView.h"

@interface D18_SliderView ()

@property (nonatomic , assign) BOOL isShowValue;
@property (nonatomic , assign) BOOL isAbove;

@property (nonatomic , strong) UILabel *valueLabel;

@property (nonatomic , strong) UISlider *slider;

@end

@implementation D18_SliderView


- (instancetype)initWithFrame:(CGRect)frame showValue:(BOOL)show valueIsAbove:(BOOL)isAbove
{
    self = [super initWithFrame:frame];
    if (self) {
        _isShowValue = show;
        _isAbove = isAbove;
        _sliderHeight = 30;
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    if (_isAbove) {
        _valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 10, 80, 80)];
        [self addSubview:_valueLabel];
        
        CGFloat sliderY = CGRectGetMaxY(_valueLabel.frame) + 15;
        _slider = [[UISlider alloc] initWithFrame:CGRectMake(20, sliderY, kScreenWidth - 40, _sliderHeight)];
        [self addSubview:_slider];
    }else{
        CGFloat sliderY = CGRectGetMaxY(_valueLabel.frame) + 15;
        _slider = [[UISlider alloc] initWithFrame:CGRectMake(20, 0, kScreenWidth - 40, _sliderHeight)];
        [self addSubview:_slider];
        
        _valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 10, 80, 80)];
        [self addSubview:_valueLabel];
        
        
    }
    
    
    _valueLabel.text = @"0";
    _valueLabel.textColor = [Utils stringTOColor:@"#ffffff"];
    _valueLabel.font = [UIFont systemFontOfSize:58];
    _valueLabel.textAlignment = NSTextAlignmentCenter;
    
    [_slider setThumbImage:[UIImage imageNamed:@"slide_HighLighted"] forState:UIControlStateNormal];
    _slider.minimumTrackTintColor = [Utils stringTOColor:@"#22a1fe"];
    _slider.maximumTrackTintColor = [Utils stringTOColor:@"#3ae0fe"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
