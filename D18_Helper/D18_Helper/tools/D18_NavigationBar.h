//
//  D18_NavigationBar.h
//  D18_Helper
//
//  Created by azz on 2017/10/4.
//  Copyright © 2017年 com.JH.TD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface D18_NavigationBar : UIView

- (instancetype)initWithTitle:(NSString *)title isShowBackButton:(BOOL)showBackButton;

- (instancetype)initWithTitle:(NSString *)title leftButtonImageName:(NSString *)leftImageName rightButtonImageName:(NSString *)rightImageName;

@end
