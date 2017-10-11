//
//  D18_FMSettingViewController.m
//  D18_Helper
//
//  Created by azz on 2017/10/4.
//  Copyright © 2017年 com.JH.TD. All rights reserved.
//

#import "D18_FMSettingViewController.h"

@interface D18_FMSettingViewController ()<D18_NavigationBarDelegate>

@property (nonatomic , strong) UIView *leftFMView;

@property (nonatomic , strong) UIView *rightFMView;

@end

@implementation D18_FMSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.view.backgroundColor = [Utils stringTOColor:@"#0d0d0d"];
    D18_NavigationBar *barView = [[D18_NavigationBar alloc] initWithTitle:@"FM" isShowBackButton:YES];
    barView.barViewDelegate = self;
    [self.view addSubview:barView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
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
