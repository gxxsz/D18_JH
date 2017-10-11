//
//  D18_ConnectCell.h
//  D18_Helper
//
//  Created by azz on 2017/10/11.
//  Copyright © 2017年 com.JH.TD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface D18_ConnectCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *deviceNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *macAddressLabel;
@property (weak, nonatomic) IBOutlet UIButton *statusBtn;

@end
