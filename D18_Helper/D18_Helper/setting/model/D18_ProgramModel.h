//
//  D18_ProgramModel.h
//  D18_Helper
//
//  Created by azz on 2017/10/11.
//  Copyright © 2017年 com.JH.TD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface D18_ProgramModel : NSObject

@property (nonatomic , strong) NSString *normalImageName;

@property (nonatomic , strong) NSString *selectedImageName;

@property (nonatomic , strong) NSString *modelName;

@property (nonatomic , assign) BOOL isSelected;

- (instancetype)initWithDict:(NSDictionary *)dict;

- (instancetype)initWithModelName:(NSString *)modelName normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedIamgeName isSelected:(BOOL)isSelected;

@end
