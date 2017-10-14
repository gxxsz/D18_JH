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

@property (strong, nonatomic) CAGradientLayer *gradientLayer;

@property (nonatomic , assign) CGFloat valueX;

@end

@implementation D18_SliderView


- (instancetype)initWithFrame:(CGRect)frame showValue:(BOOL)show valueIsAbove:(BOOL)isAbove
{
    self = [super initWithFrame:frame];
    if (self) {
        _isShowValue = show;
        _isAbove = isAbove;
        _sliderHeight = 10;
        self.backgroundColor = [UIColor clearColor];
        _valueX = 0.0;
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    CGFloat sliderY = _isAbove ? 60 : 0;
    UIImageView *sliderBackgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, sliderY, kScreenWidth, 20)];
    UIImage *backgroundImage = [UIImage imageNamed:@"FMBar"];
    sliderBackgroundView.image = backgroundImage;
    sliderBackgroundView.height = backgroundImage.size.height;
    [self addSubview:sliderBackgroundView];
    
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(20, sliderY, kScreenWidth - 40, _sliderHeight)];
    _slider.centerY = sliderBackgroundView.centerY;
    
    [self addSubview:_slider];
    
    CGFloat labelX = 25;
    CGFloat labelW = 58;
    CGFloat labelY =  _isAbove ? 0 : CGRectGetMaxY(_slider.frame) + 10;
    _valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelW, labelW)];
    
    [self addSubview:_valueLabel];
    _valueLabel.text = @"0";
    _valueLabel.textColor = [Utils stringTOColor:@"#ffffff"];
    _valueLabel.font = [UIFont systemFontOfSize:58];
    
    [_slider setThumbImage:[UIImage imageNamed:@"slide_HighLighted"] forState:UIControlStateNormal];
    _slider.backgroundColor = [UIColor clearColor];
    _slider.minimumTrackTintColor = [UIColor clearColor];
    _slider.maximumTrackTintColor = [UIColor clearColor];
    [_slider addTarget:self action:@selector(changeValueLabelText:) forControlEvents:UIControlEventValueChanged];
    _slider.minimumValue = 0.0;
    _slider.maximumValue = 4.0;
    
    CGRect layerFrame = CGRectMake(_slider.x, 0, 0, _slider.height);
    _gradientLayer =  [CAGradientLayer layer];
    _gradientLayer.frame = layerFrame;
    [_slider.layer addSublayer:_gradientLayer];
    _gradientLayer.cornerRadius = 5;
    
    
    //设置渐变颜色方向
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(1, 0);
    
    //设定颜色组
    self.gradientLayer.colors = @[(__bridge id)[Utils stringTOColor:@"#22a1fe"].CGColor,
                                  (__bridge id)[Utils stringTOColor:@"#3ae0fe"].CGColor];
    
    //设定颜色分割点
    self.gradientLayer.locations = @[@(0.5f) ,@(1.0f)];
}

- (void)changeValueLabelText:(UISlider *)slider
{
    CGFloat value = slider.value;
    _valueX = value;
    
    NSString *text = [NSString stringWithFormat:@"%ld",(NSInteger)value];
    _valueLabel.text = text;
    CGFloat labelX = 24 + value*(_slider.width-40)/4.0;

     _valueLabel.x = labelX;
    CGRect frame = _gradientLayer.frame;
    frame.size.width = labelX-10;
    if (labelX == 30.0) {
        frame.size.width = 0;
    }
    if (labelX > _slider.width-40) {
        frame.size.width =  _slider.width-40;
    }
    _gradientLayer.frame = frame;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
