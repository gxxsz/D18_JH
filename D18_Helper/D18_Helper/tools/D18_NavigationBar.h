//
//  D18_NavigationBar.h
//  D18_Helper
//
//  Created by azz on 2017/10/4.
//  Copyright © 2017年 com.JH.TD. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol D18_NavigationBarDelegate  <NSObject>

@optional
- (void)backBtnClick;

- (void)rightBtnClick;

@end

@interface D18_NavigationBar : UIView

@property (nonatomic , weak) id<D18_NavigationBarDelegate> barViewDelegate;

- (instancetype)initWithTitle:(NSString *)title isShowBackButton:(BOOL)showBackButton;

- (instancetype)initWithTitle:(NSString *)title leftButtonImageName:(NSString *)leftImageName rightButtonImageName:(NSString *)rightImageName;

@end
