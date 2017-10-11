//
//  D18_ProgramCell.h
//  D18_Helper
//
//  Created by azz on 2017/10/11.
//  Copyright © 2017年 com.JH.TD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "D18_ProgramModel.h"

@interface D18_ProgramCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *modelNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *modelImageView;

- (void)setModel:(D18_ProgramModel *)model;

@end
