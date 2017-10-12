//
//  D18_ConnectCell.m
//  D18_Helper
//
//  Created by azz on 2017/10/11.
//  Copyright © 2017年 com.JH.TD. All rights reserved.
//

#import "D18_ConnectCell.h"

@implementation D18_ConnectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _deviceNameLabel.textColor = [Utils stringTOColor:@"#ffffff"];
    _macAddressLabel.textColor = [Utils stringTOColor:@"#ffffff"];
    [_statusBtn setTintColor:[Utils stringTOColor:@"#5cb8c4"]];
    _statusBtn.layer.masksToBounds = YES;
    _statusBtn.layer.cornerRadius = 30 * 0.5;
    _statusBtn.layer.borderWidth = 1;
    _statusBtn.layer.borderColor = [Utils stringTOColor:@"#5cb8c4"].CGColor;
    self.backgroundColor = [Utils stringTOColor:@"#141414"];
    self.separatorInset = UIEdgeInsetsZero;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
