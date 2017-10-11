//
//  D18_ProgramModel.m
//  D18_Helper
//
//  Created by azz on 2017/10/11.
//  Copyright © 2017年 com.JH.TD. All rights reserved.
//

#import "D18_ProgramModel.h"

@implementation D18_ProgramModel


- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _modelName = [dict objectForKey:@"modelName"];
        _normalImageName = [dict objectForKey:@"normalImageName"];
        _selectedImageName = [dict objectForKey:@"selectedImageName"];
        _isSelected = [[dict objectForKey:@"isSelected"] boolValue];
    }
    return self;
}


- (instancetype)initWithModelName:(NSString *)modelName normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedIamgeName isSelected:(BOOL)isSelected
{
    self = [super init];
    if (self) {
        _isSelected = isSelected;
        _modelName = modelName;
        _normalImageName = normalImageName;
        _selectedImageName = selectedIamgeName;
    }
    return self;
}

@end
