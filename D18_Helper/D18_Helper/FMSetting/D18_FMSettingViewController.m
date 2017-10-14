//
//  D18_FMSettingViewController.m
//  D18_Helper
//
//  Created by azz on 2017/10/4.
//  Copyright © 2017年 com.JH.TD. All rights reserved.
//

#import "D18_FMSettingViewController.h"
#import "D18_SliderView.h"

@interface D18_FMSettingViewController ()<D18_NavigationBarDelegate>

@property (nonatomic , strong) UIView *leftFMView;

@property (nonatomic , strong) UIView *rightFMView;

@property (nonatomic , strong) UIView *backgroundView;

@property (nonatomic , strong) D18_SliderView *leftHighSliderView;

@property (nonatomic , strong) D18_SliderView *leftLowSliderView;

@property (nonatomic , strong) D18_SliderView *rightHighSliderView;

@property (nonatomic , strong) D18_SliderView *rightLowSliderView;

@property (nonatomic , assign) CGFloat backgroundViewHight;

@property (nonatomic , strong) UIView *bottomView;

@property (nonatomic , strong) UIImageView *buttonImage;

@end

@implementation D18_FMSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.view.backgroundColor = [Utils stringTOColor:@"#0d0d0d"];
    D18_NavigationBar *barView = [[D18_NavigationBar alloc] initWithTitle:@"FM" isShowBackButton:YES];
    barView.barViewDelegate = self;
    [self.view addSubview:barView];
    _backgroundViewHight = kScreenWidth > 320 ? 100 : 80;
    
    [self setUpFMBackgroundView];
    [self setUpLeftFMView];
    [self setUpRightFMView];
    [self setUpBottomView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)setUpFMBackgroundView
{
    CGFloat backgroundViewY = kScreenWidth > 375 ? 150 : 100;
    _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, backgroundViewY, kScreenWidth, 300)];
    _backgroundView.backgroundColor = [Utils stringTOColor:@"#171717"];
    [self.view addSubview:_backgroundView];
    
    CGFloat upBackgroundImageViewY = 30;
    UIImageView *upBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, upBackgroundImageViewY, kScreenWidth, _backgroundViewHight)];
    upBackgroundImageView.image = [UIImage imageNamed:@"FMBackground_up"];
    [_backgroundView addSubview:upBackgroundImageView];

    CGFloat middleBackgroundImageViewY = CGRectGetMaxY(upBackgroundImageView.frame)+ 30;
    UIImageView *middleBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, middleBackgroundImageViewY, kScreenWidth, _backgroundViewHight-20)];
    middleBackgroundImageView.image = [UIImage imageNamed:@"FMBackground_Middle"];
    [_backgroundView addSubview:middleBackgroundImageView];

    CGFloat downBackgroundImageViewY = CGRectGetMaxY(middleBackgroundImageView.frame)+ 30;
    UIImageView *downBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, downBackgroundImageViewY, kScreenWidth, _backgroundViewHight)];
    downBackgroundImageView.image = [UIImage imageNamed:@"FMBackground_down"];
    [_backgroundView addSubview:downBackgroundImageView];
    _backgroundView.height = CGRectGetMaxY(downBackgroundImageView.frame)+30;
    
    [self frequencyViewWithYvalue:0 isHighFM:YES];
    CGFloat bottomFequencyViewY = _backgroundView.height - 30;
    [self frequencyViewWithYvalue:bottomFequencyViewY isHighFM:NO];
    
}

- (void)setUpLeftFMView
{
    _leftFMView = [[UIView alloc] initWithFrame:_backgroundView.bounds];
    _leftFMView.backgroundColor = [UIColor clearColor];


    CGFloat leftHighY = _backgroundViewHight-30;
    _leftHighSliderView = [[D18_SliderView alloc] initWithFrame:CGRectMake(0, leftHighY, kScreenWidth, _backgroundViewHight) showValue:YES valueIsAbove:YES];
    [_leftFMView addSubview:_leftHighSliderView];

    CGFloat leftLowY = CGRectGetMaxY(_leftHighSliderView.frame) + _backgroundViewHight-(kScreenWidth > 320 ? 30 : 10);
    _leftLowSliderView = [[D18_SliderView alloc] initWithFrame:CGRectMake(0, leftLowY, kScreenWidth, _backgroundViewHight) showValue:YES valueIsAbove:NO];
    [_leftFMView addSubview:_leftLowSliderView];
    [_backgroundView bringSubviewToFront:_leftFMView];
    
    [_backgroundView addSubview:_leftFMView];
}

- (void)setUpRightFMView
{
    
    _rightFMView = [[UIView alloc] initWithFrame:_backgroundView.bounds];
    _rightFMView.backgroundColor = [UIColor clearColor];
    [_backgroundView addSubview:_rightFMView];


    CGFloat rightHighY = _backgroundViewHight-30;
    _rightHighSliderView = [[D18_SliderView alloc] initWithFrame:CGRectMake(0, rightHighY, kScreenWidth, _backgroundViewHight) showValue:YES valueIsAbove:YES];
    [_rightFMView addSubview:_rightHighSliderView];

    CGFloat rightLowY = CGRectGetMaxY(_rightHighSliderView.frame) + _backgroundViewHight-(kScreenWidth > 320 ? 30 : 10);
    _rightLowSliderView = [[D18_SliderView alloc] initWithFrame:CGRectMake(0, rightLowY, kScreenWidth, _backgroundViewHight) showValue:YES valueIsAbove:NO];
    [_rightFMView addSubview:_rightLowSliderView];
    _rightFMView.hidden = YES;
    
    
}

- (void)setUpBottomView
{
    CGFloat bottomViewY = CGRectGetMaxY(_backgroundView.frame) + 50;
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, bottomViewY, kScreenWidth, 50)];
    _bottomView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_bottomView];
    
    _buttonImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 140, 50)];
    _buttonImage.image = [UIImage imageNamed:@"FMChange_Left"];
    [_bottomView addSubview:_buttonImage];
    _buttonImage.centerX = kScreenWidth*0.5;
    _buttonImage.contentMode = UIViewContentModeCenter;
    
    CGFloat leftButtonX = kScreenWidth * 0.5 - 70;
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(leftButtonX, 0, 70, 50)];
    [leftButton addTarget:self action:@selector(changeToLeftFMView) forControlEvents:UIControlEventTouchUpInside];
    leftButton.backgroundColor = [UIColor clearColor];
    [_bottomView addSubview:leftButton];
    
    
    CGFloat rightButtonX = kScreenWidth * 0.5;
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(rightButtonX, 0, 70, 50)];
    [rightButton addTarget:self action:@selector(changeToRightFMView) forControlEvents:UIControlEventTouchUpInside];
    rightButton.backgroundColor = [UIColor clearColor];
    [_bottomView addSubview:rightButton];
}

- (void)frequencyViewWithYvalue:(CGFloat)Yvalue isHighFM:(BOOL)isHigh
{
    UIView *frequencyView = [[UIView alloc] initWithFrame:CGRectMake(0, Yvalue, kScreenWidth, 30)];
    frequencyView.backgroundColor = [UIColor clearColor];
    [_backgroundView addSubview:frequencyView];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 8, kScreenWidth, 15)];
    label1.text = isHigh ? @"High Frequency" : @"Low Frequency";
    label1.textColor = [Utils stringTOColor:@"#999999"];
    label1.font = [UIFont systemFontOfSize:12];
    [label1 sizeToFit];
    label1.center =  CGPointMake(kScreenWidth*0.5, 30*0.5);
    label1.backgroundColor = [UIColor clearColor];
    [frequencyView addSubview:label1];
    
    CGFloat frontViewX = CGRectGetMinX(label1.frame) - 28;
    UIView *frontView = [[UIView alloc] initWithFrame:CGRectMake(frontViewX, 10, 20, 0.5)];
    frontView.backgroundColor = [Utils stringTOColor:@"#999999"];
    frontView.centerY = label1.centerY;
    [frequencyView addSubview:frontView];
    
    CGFloat behindViewX = CGRectGetMaxX(label1.frame) + 8;
    UIView *behindView = [[UIView alloc] initWithFrame:CGRectMake(behindViewX, 10, 20, 0.5)];
    behindView.backgroundColor = [Utils stringTOColor:@"#999999"];
    behindView.centerY = label1.centerY;
    [frequencyView addSubview:behindView];
    
}


- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)changeToLeftFMView
{
    [self showRightFMView:NO];
}

- (void)changeToRightFMView
{
    [self showRightFMView:YES];
}

- (void)showRightFMView:(BOOL)showRight
{
    if (showRight) {
        _buttonImage.image = [UIImage imageNamed:@"FMChange_Right"];
        _leftFMView.hidden = YES;
        _rightFMView.hidden = NO;
        
    }else{
        _buttonImage.image = [UIImage imageNamed:@"FMChange_Left"];
        _leftFMView.hidden = NO;
        _rightFMView.hidden = YES;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
