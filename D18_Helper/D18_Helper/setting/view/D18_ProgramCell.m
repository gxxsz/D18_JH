//
//  D18_ProgramCell.m
//  D18_Helper
//
//  Created by azz on 2017/10/11.
//  Copyright © 2017年 com.JH.TD. All rights reserved.
//

#import "D18_ProgramCell.h"

@interface D18_ProgramCell ()

@property (nonatomic , strong) D18_ProgramModel *model;

@end

@implementation D18_ProgramCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [Utils stringTOColor:@"#141414"];
}

- (void)setModel:(D18_ProgramModel *)model
{
    _model = model;
    if (model.isSelected) {
        [_modelImageView setImage:[UIImage imageNamed:model.selectedImageName]];
        [_modelNameLabel setText:model.modelName];
        _modelNameLabel.textColor = [Utils stringTOColor:@"#5cb8c4"];
    }else{
        [_modelImageView setImage:[UIImage imageNamed:model.normalImageName]];
        [_modelNameLabel setText:model.modelName];
        _modelNameLabel.textColor = [Utils stringTOColor:@"#ffffff"];
    }
}



@end
