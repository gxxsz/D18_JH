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
    CGRect frmae = CGRectMake(0, 0, kScreenWidth, 64);
    self = [super initWithFrame:frmae];
    if (self) {
        _title = title;
        _showBackBtn = YES;
        _leftImageName = leftImageName;
        _rightImageName = rightImageName;
        
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    self.backgroundColor = [Utils stringTOColor:@"#141414"];
    if (_showBackBtn) {
        _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 44, 44)];
        [_leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
        if (_leftImageName && _leftImageName.length > 0) {
            [_leftBtn setImage:[UIImage imageNamed:_leftImageName] forState:UIControlStateNormal];
            
        }else{
            [_leftBtn setImage:[UIImage imageNamed:@"back_Normal"] forState:UIControlStateNormal];
            [_leftBtn setImage:[UIImage imageNamed:@"back_HighLighted"] forState:UIControlStateHighlighted];
        }
        [self addSubview:_leftBtn];
    }
    
    if (_rightImageName && _rightImageName.length > 0) {
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - 60, 20, 44, 44)];
        [_rightBtn addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
        [_rightBtn setImage:[UIImage imageNamed:_rightImageName] forState:UIControlStateNormal];
        [self addSubview:_rightBtn];
    }
    if (_title && _title.length > 0) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, kScreenWidth - 120, 44)];
        _titleLabel.font = [UIFont systemFontOfSize:17];
        _titleLabel.textColor = [Utils stringTOColor:@"#ffffff"];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.centerX = self.centerX;
        _titleLabel.text = _title;
        [self addSubview:_titleLabel];
    }
}


- (void)leftBtnClick
{
    if (self.barViewDelegate && [self.barViewDelegate respondsToSelector:@selector(backBtnClick)]) {
        [self.barViewDelegate backBtnClick];
    }
}

- (void)rightClick
{
    if (self.barViewDelegate && [self.barViewDelegate respondsToSelector:@selector(rightBtnClick)]) {
        [self.barViewDelegate rightBtnClick];
    }
}











@end
