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

@end

@implementation D18_HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.view.backgroundColor = [Utils stringTOColor:@"#0d0d0d"];
    D18_NavigationBar *barView = [[D18_NavigationBar alloc] initWithTitle:@"Demo" leftButtonImageName:@"setting_Normal" rightButtonImageName:@"FM_Normal"];
    barView.barViewDelegate = self;
    [self.view addSubview:barView];
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
