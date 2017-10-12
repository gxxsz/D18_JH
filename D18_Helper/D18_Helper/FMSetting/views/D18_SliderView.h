//
//  D18_SliderView.h
//  D18_Helper
//
//  Created by azz on 2017/10/12.
//  Copyright © 2017年 com.JH.TD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface D18_SliderView : UIView

@property (nonatomic , assign) CGFloat sliderHeight;

- (instancetype)initWithFrame:(CGRect)frame showValue:(BOOL)show valueIsAbove:(BOOL)isAbove;


@end
