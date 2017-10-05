//
//  D18_NavigationBar.m
//  D18_Helper
//
//  Created by azz on 2017/10/4.
//  Copyright © 2017年 com.JH.TD. All rights reserved.
//

#import "D18_NavigationBar.h"

@interface D18_NavigationBar ()

@property (nonatomic,strong) UIButton *leftBtn;

@property (nonatomic,strong) UIButton *rightBtn;

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) NSString *title;

@property (nonatomic,assign) BOOL showBackBtn;

@property (nonatomic,assign) BOOL showRightBtn;

@property (nonatomic,strong) NSString *leftImageName;

@property (nonatomic,strong) NSString *rightImageName;

@end


@implementation D18_NavigationBar



- (instancetype)initWithTitle:(NSString *)title isShowBackButton:(BOOL)showBackButton
{
    
    self = [self initWithTitle:title leftButtonImageName:nil rightButtonImageName:nil];
    if (self) {
        _title = title;
        _showBackBtn = showBackButton;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title leftButtonImageName:(NSString *)leftImageName rightButtonImageName:(NSString *)rightImageName
{
    CGRect frmae = CGRectMake(0, 0, 375, 44);
    self = [super initWithFrame:frmae];
    if (self) {
        _leftImageName = leftImageName;
        _rightImageName = rightImageName;
        
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
