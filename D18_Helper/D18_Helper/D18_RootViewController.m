//
//  D18_RootViewController.m
//  D18_Helper
//
//  Created by azz on 2017/10/4.
//  Copyright © 2017年 com.JH.TD. All rights reserved.
//

#import "D18_RootViewController.h"
#import "D18_SettingViewController.h"
#import "D18_FMSettingViewController.h"
#import "D18_HomePageViewController.h"

@interface D18_RootViewController ()

@property (nonatomic , strong) D18_SettingViewController *settingCtl;

@property (nonatomic , strong) D18_HomePageViewController *homePageCtl;

@property (nonatomic , strong) D18_FMSettingViewController *fmSettingCtl;

@property (nonatomic , strong) UIViewController *currentCtl;

@end

@implementation D18_RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    _homePageCtl = [[D18_HomePageViewController alloc] init];
    self.navigationController.navigationBar.hidden = YES;
    [self addChildViewController:_homePageCtl];
    [self.view addSubview:_homePageCtl.view];
    _currentCtl = _homePageCtl;
    
    _settingCtl = [[D18_SettingViewController alloc] init];
    [self addChildViewController:_settingCtl];
    
    _fmSettingCtl = [[D18_FMSettingViewController alloc] init];
    [self addChildViewController:_fmSettingCtl];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
