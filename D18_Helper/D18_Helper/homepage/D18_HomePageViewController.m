//
//  D18_HomePageViewController.m
//  D18_Helper
//
//  Created by azz on 2017/10/4.
//  Copyright © 2017年 com.JH.TD. All rights reserved.
//

#import "D18_HomePageViewController.h"
#import "D18_SettingViewController.h"
#import "D18_FMSettingViewController.h"

@interface D18_HomePageViewController ()<D18_NavigationBarDelegate>

@property (nonatomic , strong) UIView *modelTitleView;

@property (nonatomic , strong) UILabel *modelLabel;

@property (nonatomic , strong) UIView *leftLineView;

@property (nonatomic , strong) UIView *rightLineView;

@property (nonatomic , strong) UIView *centerView;

@property (nonatomic , strong) UIImageView *centerBackgroundImage;

@property (nonatomic , strong) UIImageView *progressImageView;

@property (nonatomic , strong) UIImageView *leftBlockImageView;

@property (nonatomic , strong) UIImageView *rightBlockImageView;

@property (nonatomic , strong) UIView *leftCoverView;

@property (nonatomic , strong) UIView *rightCoverView;

@property (nonatomic , strong) UILabel *leftSoundLabel;

@property (nonatomic , strong) UILabel *rightSoundLabel;

@end

@implementation D18_HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.view.backgroundColor = [Utils stringTOColor:@"#0d0d0d"];
    D18_NavigationBar *barView = [[D18_NavigationBar alloc] initWithTitle:@"Demo" leftButtonImageName:@"setting_Normal" rightButtonImageName:@"FM_Normal"];
    barView.barViewDelegate = self;
    [self.view addSubview:barView];
    
    [self setUpModelTitleView];
    [self setUpCenterView];
}

- (void)setUpModelTitleView
{
    _modelTitleView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 31)];
    _modelTitleView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_modelTitleView];
    
    _modelLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 8, kScreenWidth, 15)];
    _modelLabel.text = @"Normal Mode";
    _modelLabel.textColor = [Utils stringTOColor:@"#ffffff"];
    _modelLabel.font = [UIFont systemFontOfSize:12];
    [_modelLabel sizeToFit];
    _modelLabel.centerX =  kScreenWidth*0.5;
    _modelLabel.backgroundColor = [UIColor clearColor];
    [_modelTitleView addSubview:_modelLabel];
    
    CGFloat leftLineViewX = CGRectGetMinX(_modelLabel.frame) - 28;
    _leftLineView = [[UIView alloc] initWithFrame:CGRectMake(leftLineViewX, 10, 20, 1)];
    _leftLineView.backgroundColor = [Utils stringTOColor:@"#ffffff"];
    _leftLineView.centerY = _modelLabel.centerY;
    [_modelTitleView addSubview:_leftLineView];
    
    CGFloat rightLineViewX = CGRectGetMaxX(_modelLabel.frame) + 8;
    _rightLineView = [[UIView alloc] initWithFrame:CGRectMake(rightLineViewX, 10, 20, 1)];
    _rightLineView.backgroundColor = [Utils stringTOColor:@"#ffffff"];
    _rightLineView.centerY = _modelLabel.centerY;
    [_modelTitleView addSubview:_rightLineView];
}

- (void)setUpCenterView
{
    _centerView = [[UIView alloc] init];
    CGFloat centerViewWidth = kScreenWidth - 50;
    _centerView.size = CGSizeMake(centerViewWidth, centerViewWidth);
    _centerView.center = self.view.center;
    _centerView.backgroundColor = [UIColor  clearColor];
    [self.view addSubview:_centerView];
    
    _centerBackgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"roundBackground"]];
    CGFloat backgroundImageWidth = centerViewWidth;
    _centerBackgroundImage.frame = CGRectMake(0, 0, backgroundImageWidth, backgroundImageWidth);
    [_centerView addSubview:_centerBackgroundImage];
    
    UIImageView *volumeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"volume_round"]];
    
    volumeImageView.size = CGSizeMake(backgroundImageWidth, backgroundImageWidth);
    volumeImageView.frame = CGRectMake(0, 0, backgroundImageWidth, backgroundImageWidth);
    [_centerView addSubview:volumeImageView];
    
    CGFloat modifyY = 6;
    CGFloat modifyRadius = 17;
    if (kScreenWidth< 375) {
        modifyY = 5;
        modifyRadius = 14.5;
    }
    else if (kScreenWidth > 375) {
        modifyY = 7;
        modifyRadius = 19;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(centerViewWidth*0.5, centerViewWidth*0.5+modifyY) radius:centerViewWidth*0.5-modifyRadius startAngle:M_PI/2+M_PI/18 endAngle:M_PI*3/2-M_PI/18  clockwise:YES];
    CAShapeLayer *cicleLayer = [CAShapeLayer layer];
    cicleLayer.path = path.CGPath;
    cicleLayer.strokeColor = [UIColor redColor].CGColor;
    cicleLayer.fillColor   = [UIColor clearColor].CGColor;
    cicleLayer.lineWidth = 2;
    [_centerView.layer addSublayer:cicleLayer];
    
    _leftBlockImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"slide_HighLighted"]];
    _leftBlockImageView.frame = CGRectMake(centerViewWidth*0.5-10, centerViewWidth-10, 40, 40);
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //在动画设置一些变量
    pathAnimation.calculationMode = kCAAnimationPaced;
    //我们希望动画持续
    //如果我们动画从左到右的东西——我们想要呆在新位置,
    //然后我们需要这些参数
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.duration = 5;//完成动画的时间
    //让循环连续演示
    pathAnimation.repeatCount = MAXFLOAT;
    pathAnimation.path = path.CGPath;
    [_centerView addSubview:_leftBlockImageView];
    [_leftBlockImageView.layer addAnimation:pathAnimation forKey:@"changeRound"];
}

- (void)backBtnClick
{
    D18_SettingViewController *settingCtl = [[D18_SettingViewController alloc] init];
    
    [self.navigationController pushViewController:settingCtl animated:YES];
}

- (void)rightBtnClick
{
    D18_FMSettingViewController *FMSettingCtl = [[D18_FMSettingViewController alloc] init];

    [self.navigationController pushViewController:FMSettingCtl animated:YES];
}

- (void)updateModeTitleViewWithTitle:(NSString *)modeTitle
{
    if (modeTitle && modeTitle.length > 0) {
        _modelLabel.text = modeTitle;
        [_modelLabel sizeToFit];
        _modelLabel.centerX = kScreenWidth*0.5;
        
        CGFloat leftLineViewX = CGRectGetMinX(_modelLabel.frame) - 28;
        _leftLineView.x = leftLineViewX;
        CGFloat rightLineViewX = CGRectGetMaxX(_modelLabel.frame) + 8;
        _rightLineView.x = rightLineViewX;
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
