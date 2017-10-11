//
//  D18_SettingViewController.m
//  D18_Helper
//
//  Created by azz on 2017/10/4.
//  Copyright © 2017年 com.JH.TD. All rights reserved.
//

#import "D18_SettingViewController.h"
#import "D18_NavigationBar.h"

@interface D18_SettingViewController ()<D18_NavigationBarDelegate>

@property (nonatomic , strong) UIView *connectView;

@property (nonatomic , strong) UIView *programView;

@property (nonatomic , strong) UIButton *firstDeviceStatusBtn;

@property (nonatomic , strong) UIButton *secondDeviceStatusBtn;

@property (nonatomic , strong) UILabel *nameLabelOne;

@property (nonatomic , strong) UILabel *nameLabelTwo;

@property (nonatomic , strong) UILabel *macAddressLabelOne;

@property (nonatomic , strong) UILabel *macAddressLabelTwo;

@end

@implementation D18_SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.view.backgroundColor = [Utils stringTOColor:@"#0d0d0d"];
    D18_NavigationBar *barView = [[D18_NavigationBar alloc] initWithTitle:@"SET" isShowBackButton:YES];
    barView.barViewDelegate = self;
    [self.view addSubview:barView];
    
    [self setUpConnectView];
    [self setUpProgramView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)setUpConnectView
{
    _connectView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth, 200)];
    _connectView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_connectView];
    UIView *lineOne = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.5)];
    lineOne.backgroundColor = [Utils stringTOColor:@"#3a3a3a"];
    [_connectView addSubview:lineOne];
    
    CGFloat labelY = 15;
    UILabel *deviceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, labelY, kScreenWidth, 20)];
    deviceLabel.text = @"Connected Device";
    deviceLabel.font = [UIFont systemFontOfSize:13];
    deviceLabel.textColor = [Utils stringTOColor:@"#999999"];
    [_connectView addSubview:deviceLabel];
    
    CGFloat lineTwoY = CGRectGetMaxY(deviceLabel.frame) + 6;
    UIView *lineTwo = [self creatLineViewWithY:lineTwoY];
    
    //第一个设备
    CGFloat nameLabelOneY = CGRectGetMaxY(lineTwo.frame) + 8;
    CGFloat nameLabelX = 10;
    CGFloat nameLabelH = 22;
    CGFloat nameLabelW = kScreenWidth - 120;
    _nameLabelOne = [[UILabel alloc] initWithFrame:CGRectMake(nameLabelX, nameLabelOneY, nameLabelW, nameLabelH)];
    _nameLabelOne.font = [UIFont systemFontOfSize:17];
    _nameLabelOne.textColor = [Utils stringTOColor:@"#ffffff"];
    _nameLabelOne.text = @"JINGHAO 1";
    [_connectView addSubview:_nameLabelOne];
    
    CGFloat macAddressLabelY = CGRectGetMaxY(_nameLabelOne.frame);
    CGFloat macAddressLabelH = 11;
    _macAddressLabelOne = [[UILabel alloc] initWithFrame:CGRectMake(nameLabelX, macAddressLabelY, nameLabelW, macAddressLabelH)];
    _macAddressLabelOne.textColor = [Utils stringTOColor:@"#ffffff"];
    _macAddressLabelOne.font = [UIFont systemFontOfSize:11];
    _macAddressLabelOne.text = @"mac address";
    [_connectView addSubview:_macAddressLabelOne];
    
    CGFloat statusBtnW = 70;
    CGFloat statusBtnH = 30;
    CGFloat statusBtnX = kScreenWidth - 16 - 70;
    CGFloat statusBtnY = CGRectGetMaxY(lineTwo.frame) + 7;
    _firstDeviceStatusBtn = [[UIButton alloc] initWithFrame:CGRectMake(statusBtnX, statusBtnY, statusBtnW, statusBtnH)];
    [_firstDeviceStatusBtn setTitle:@"OFF" forState:UIControlStateNormal];
    [_firstDeviceStatusBtn setTintColor:[Utils stringTOColor:@"#5cb8c4"]];
    _firstDeviceStatusBtn.layer.masksToBounds = YES;
    _firstDeviceStatusBtn.layer.cornerRadius = statusBtnH * 0.5;
    _firstDeviceStatusBtn.layer.borderWidth = 1;
    _firstDeviceStatusBtn.layer.borderColor = [Utils stringTOColor:@"#5cb8c4"].CGColor;
    [_connectView addSubview:_firstDeviceStatusBtn];
    
    
    
    CGFloat lineThreeY = CGRectGetMaxY(lineTwo.frame) + 45;
    UIView *lineThree = [self creatLineViewWithY:lineThreeY];
    
    
    //第二个设备
    CGFloat nameLabelTwoY = CGRectGetMaxY(lineThree.frame) + 8;
    _nameLabelTwo = [[UILabel alloc] initWithFrame:CGRectMake(nameLabelX, nameLabelTwoY, nameLabelW, nameLabelH)];
    _nameLabelTwo.font = [UIFont systemFontOfSize:17];
    _nameLabelTwo.textColor = [Utils stringTOColor:@"#ffffff"];
    _nameLabelTwo.text = @"JINGHAO 2";
    [_connectView addSubview:_nameLabelTwo];
    
    CGFloat macAddressLabel2Y = CGRectGetMaxY(_nameLabelTwo.frame);
    _macAddressLabelTwo = [[UILabel alloc] initWithFrame:CGRectMake(nameLabelX, macAddressLabel2Y, nameLabelW, macAddressLabelH)];
    _macAddressLabelTwo.textColor = [Utils stringTOColor:@"#ffffff"];
    _macAddressLabelTwo.font = [UIFont systemFontOfSize:11];
    _macAddressLabelTwo.text = @"mac address";
    [_connectView addSubview:_macAddressLabelTwo];
    
    CGFloat statusBtnTwoY = CGRectGetMaxY(lineThree.frame) + 7;
    _secondDeviceStatusBtn = [[UIButton alloc] initWithFrame:CGRectMake(statusBtnX, statusBtnTwoY, statusBtnW, statusBtnH)];
    [_secondDeviceStatusBtn setTitle:@"OFF" forState:UIControlStateNormal];
    [_secondDeviceStatusBtn setTintColor:[Utils stringTOColor:@"#5cb8c4"]];
    _secondDeviceStatusBtn.layer.masksToBounds = YES;
    _secondDeviceStatusBtn.layer.cornerRadius = statusBtnH * 0.5;
    _secondDeviceStatusBtn.layer.borderWidth = 1;
    _secondDeviceStatusBtn.layer.borderColor = [Utils stringTOColor:@"#5cb8c4"].CGColor;
    [_connectView addSubview:_secondDeviceStatusBtn];
    
    
    CGFloat lineFourY = CGRectGetMaxY(lineThree.frame) + 45;
    UIView *lineFour = [self creatLineViewWithY:lineFourY];
    
    
    CGFloat lineFiveY = CGRectGetMaxY(lineFour.frame) + 10;
    UIView *lineFive = [self creatLineViewWithY:lineFiveY];
    
    CGFloat blueLabelY = CGRectGetMaxY(lineFive.frame);
    UILabel *blueLable = [[UILabel alloc] initWithFrame:CGRectMake(0, blueLabelY, kScreenWidth, 44)];
    blueLable.text = @"Bluetooth";
    blueLable.textColor = [Utils stringTOColor:@"#5cb8c4"];
    blueLable.textAlignment = NSTextAlignmentCenter;
    blueLable.font = [UIFont systemFontOfSize:17];
    [_connectView addSubview:blueLable];
    
    CGFloat lineSixY = CGRectGetMaxY(lineFive.frame) + 45;
    UIView *lineSix = [self creatLineViewWithY:lineSixY];
    
    CGFloat connectViewH = CGRectGetMaxY(lineSix.frame);
    _connectView.height = connectViewH;
}

- (void)setUpProgramView
{
    CGFloat programViewY = CGRectGetMaxY(_connectView.frame);
    _programView = [[UIView alloc] initWithFrame:CGRectMake(0, programViewY, kScreenWidth, 200)];
    _programView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_programView];
    
    CGFloat programLabelY = 30;
    UILabel *programLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, programLabelY, kScreenWidth - 100, 20)];
    programLabel.text = @"My Program";
    programLabel.font = [UIFont systemFontOfSize:13];
    programLabel.textColor = [Utils stringTOColor:@"#999999"];
    [_programView addSubview:programLabel];
    
    CGFloat modelBtnH = 112;
    CGFloat modelBtnW = kScreenWidth * 0.5;
    CGFloat modelBtnY = CGRectGetMaxY(programLabel.frame) + 6;
    
    UIButton *normalBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, modelBtnY, modelBtnW, modelBtnH)];
    [normalBtn setImage:[UIImage imageNamed:@"default_Normal"] forState:UIControlStateNormal];
    [normalBtn setImage:[UIImage imageNamed:@"default_selected"] forState:UIControlStateHighlighted];
    [normalBtn setTitle:@"Normal" forState:UIControlStateNormal];
    [normalBtn setTitleColor:[Utils stringTOColor:@"#ffffff"] forState:UIControlStateNormal];
    [normalBtn setTitle:@"Normal" forState:UIControlStateHighlighted];
    [normalBtn setTitleColor:[Utils stringTOColor:@"#5cb8c4"] forState:UIControlStateHighlighted];
    [normalBtn addTarget:self action:@selector(normalBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [_programView addSubview:normalBtn];
    
    UIButton *noiseBtn = [[UIButton alloc] initWithFrame:CGRectMake(modelBtnW, modelBtnY, modelBtnW, modelBtnH)];
    [noiseBtn setImage:[UIImage imageNamed:@"noise_normal"] forState:UIControlStateNormal];
    [noiseBtn setImage:[UIImage imageNamed:@"noise_selected"] forState:UIControlStateHighlighted];
    [noiseBtn setTitle:@"Noise Reduction" forState:UIControlStateNormal];
    [noiseBtn setTitleColor:[Utils stringTOColor:@"#ffffff"] forState:UIControlStateNormal];
    [noiseBtn setTitle:@"Noise Reduction" forState:UIControlStateHighlighted];
    [noiseBtn setTitleColor:[Utils stringTOColor:@"#5cb8c4"] forState:UIControlStateHighlighted];
    [noiseBtn addTarget:self action:@selector(noiseBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [_programView addSubview:noiseBtn];
    
    UIButton *outdoorsBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, modelBtnY + modelBtnH, modelBtnW, modelBtnH)];
    [outdoorsBtn setImage:[UIImage imageNamed:@"outside_Normal"] forState:UIControlStateNormal];
    [outdoorsBtn setImage:[UIImage imageNamed:@"outside_Selected"] forState:UIControlStateHighlighted];
    [outdoorsBtn setTitle:@"Outdoors" forState:UIControlStateNormal];
    [outdoorsBtn setTitleColor:[Utils stringTOColor:@"#ffffff"] forState:UIControlStateNormal];
    [outdoorsBtn setTitle:@"Outdoors" forState:UIControlStateHighlighted];
    [outdoorsBtn setTitleColor:[Utils stringTOColor:@"#5cb8c4"] forState:UIControlStateHighlighted];
    [outdoorsBtn addTarget:self action:@selector(outdoorsBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [_programView addSubview:outdoorsBtn];
    
    UIButton *tinitusBtn = [[UIButton alloc] initWithFrame:CGRectMake(modelBtnW, modelBtnY+modelBtnH, modelBtnW, modelBtnH)];
    [tinitusBtn setImage:[UIImage imageNamed:@"tinitus_normal"] forState:UIControlStateNormal];
    [tinitusBtn setImage:[UIImage imageNamed:@"tinitus_selected"] forState:UIControlStateHighlighted];
    [tinitusBtn setTitle:@"Tinitus Treatment" forState:UIControlStateNormal];
    [tinitusBtn setTitleColor:[Utils stringTOColor:@"#ffffff"] forState:UIControlStateNormal];
    [tinitusBtn setTitle:@"Tinitus Treatment" forState:UIControlStateHighlighted];
    [tinitusBtn setTitleColor:[Utils stringTOColor:@"#5cb8c4"] forState:UIControlStateHighlighted];
    [tinitusBtn addTarget:self action:@selector(tinitusBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [_programView addSubview:tinitusBtn];
    
    CGFloat lineY = CGRectGetMaxY(tinitusBtn.frame)+10;
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, lineY, kScreenWidth, 0.5)];
    line.backgroundColor = [Utils stringTOColor:@"#333333"];
    [_programView addSubview:line];
    
    CGFloat otherLineY = CGRectGetMaxY(line.frame)+45;
    UIView *otherLine = [[UIView alloc] initWithFrame:CGRectMake(0, otherLineY, kScreenWidth, 0.5)];
    otherLine.backgroundColor = [Utils stringTOColor:@"#333333"];
    [_programView addSubview:line];
    
    CGFloat helpLabelY = otherLineY - 45;
    UILabel *helpLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, helpLabelY, kScreenWidth - 70, 44)];
    helpLabel.text = @"Help";
    helpLabel.font = [UIFont systemFontOfSize:17];
    helpLabel.textColor = [Utils stringTOColor:@"#ffffff"];
    [_programView addSubview:helpLabel];
    
    CGFloat arrowX = kScreenWidth - 60;
    UIImageView *arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(arrowX, helpLabelY, 44, 44)];
    arrowView.image = [UIImage imageNamed:@"rightArrow_Normal"];
    arrowView.contentMode = UIViewContentModeCenter;
    [_programView addSubview:arrowView];
    
}

- (UIView *)creatLineViewWithY:(CGFloat)yValue
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, yValue, kScreenWidth, 0.5)];
    line.backgroundColor = [Utils stringTOColor:@"#333333"];
    [_connectView addSubview:line];
    return line;
}

//普通模式点击
- (void)normalBtnClick
{
    
}

//降噪模式点击
- (void)noiseBtnClick
{
    
}

//户外模式点击
- (void)outdoorsBtnClick
{
    
}

//耳鸣治疗模式点击
- (void)tinitusBtnClick
{
    
}

- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
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
