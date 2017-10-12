//
//  D18_SettingViewController.m
//  D18_Helper
//
//  Created by azz on 2017/10/4.
//  Copyright © 2017年 com.JH.TD. All rights reserved.
//

#import "D18_SettingViewController.h"
#import "D18_NavigationBar.h"
#import "D18_ConnectCell.h"
#import "D18_ProgramCell.h"

@interface D18_SettingViewController ()<D18_NavigationBarDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic , strong) UITableView *connectTable;

@property (nonatomic , strong) UICollectionView *programCollectionView;

@property (nonatomic , strong) UILabel *blueLable;

@property (nonatomic , strong) NSMutableArray *programs;

@end

static NSString *conncetTableIdentifier = @"conncetTableIdentifier";
static NSString *programCollectionViewIdentifier = @"programCollectionViewIdentifier";

@implementation D18_SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.view.backgroundColor = [Utils stringTOColor:@"#0d0d0d"];
    D18_NavigationBar *barView = [[D18_NavigationBar alloc] initWithTitle:@"SET" isShowBackButton:YES];
    barView.barViewDelegate = self;
    [self.view addSubview:barView];
    
    _programs = [Utils getProgramArray];
    
    [self setUpConnectTableView];
    [self setUpProgramCollectionView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)setUpConnectTableView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 45)];
    headerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:headerView];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.5)];
    line.backgroundColor = [Utils stringTOColor:@"#333333"];
    [headerView addSubview:line];
    
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 44.5, kScreenWidth, 0.5)];
    line1.backgroundColor = [Utils stringTOColor:@"#333333"];
    [headerView addSubview:line1];
    UILabel *connectLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 14, 200,15)];
    connectLabel.text = @"Connected Device";
    connectLabel.textColor = [Utils stringTOColor:@"#999999"];
    connectLabel.font = [UIFont systemFontOfSize:13];
    [headerView addSubview:connectLabel];
    
    
    
    
    _connectTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 45*3) style:UITableViewStylePlain];
    _connectTable.dataSource = self;
    _connectTable.delegate = self;
    _connectTable.backgroundColor = [UIColor clearColor];
    _connectTable.separatorColor = [Utils stringTOColor:@"#333333"];
    [_connectTable registerNib:[UINib nibWithNibName:@"D18_ConnectCell" bundle:nil] forCellReuseIdentifier:conncetTableIdentifier];
    _connectTable.tableHeaderView = headerView;
    [self.view addSubview:_connectTable];
    _connectTable.hidden = YES;
    
    CGFloat blueLabelY = _connectTable.hidden ? 74 : CGRectGetMaxY(_connectTable.frame) + 10;
    _blueLable = [[UILabel alloc] initWithFrame:CGRectMake(-1, blueLabelY, kScreenWidth+2, 44)];
    _blueLable.text = @"Bluetooth";
    _blueLable.textColor = [Utils stringTOColor:@"#5cb8c4"];
    _blueLable.textAlignment = NSTextAlignmentCenter;
    _blueLable.font = [UIFont systemFontOfSize:17];
    _blueLable.backgroundColor = [Utils stringTOColor:@"#171717"];
    _blueLable.layer.borderWidth = 0.5;
    _blueLable.layer.borderColor = [Utils stringTOColor:@"#333333"].CGColor;
    [self.view addSubview:_blueLable];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(linkBluetooth)];
    [_blueLable addGestureRecognizer:tap];
    
    
}

- (void)setUpProgramCollectionView
{
    CGFloat programLabelY = CGRectGetMaxY(_blueLable.frame) + 30;
    UILabel *programLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, programLabelY, kScreenWidth - 100, 20)];
    programLabel.text = @"My Program";
    programLabel.font = [UIFont systemFontOfSize:13];
    programLabel.textColor = [Utils stringTOColor:@"#999999"];
    [self.view addSubview:programLabel];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat itemH = kScreenWidth < 375 ? 82 : 112;
    CGFloat itemW = kScreenWidth * 0.5;
    layout.itemSize = CGSizeMake(itemW, itemH);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    CGFloat collectionY = CGRectGetMaxY(programLabel.frame)+6;
    _programCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, collectionY, kScreenWidth, itemH*2+1) collectionViewLayout:layout];
    _programCollectionView.backgroundColor = [UIColor clearColor];
    [_programCollectionView registerNib:[UINib nibWithNibName:@"D18_ProgramCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:programCollectionViewIdentifier];
    
    _programCollectionView.scrollEnabled = NO;
    [self.view addSubview:_programCollectionView];
    _programCollectionView.delegate = self;
    _programCollectionView.dataSource = self;
    

    
    CGFloat helpLabelY = CGRectGetMaxY(_programCollectionView.frame)+10;
    UILabel *helpLabel = [[UILabel alloc] initWithFrame:CGRectMake(-1, helpLabelY, kScreenWidth+2, 44)];
    helpLabel.text = @"      Help";
    helpLabel.font = [UIFont systemFontOfSize:17];
    helpLabel.textColor = [Utils stringTOColor:@"#ffffff"];
    helpLabel.backgroundColor = [Utils stringTOColor:@"#171717"];
    helpLabel.layer.borderWidth = 0.5;
    helpLabel.layer.borderColor = [Utils stringTOColor:@"#333333"].CGColor;
    
    [self.view addSubview:helpLabel];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(helpLabelClick)];
    [helpLabel addGestureRecognizer:tap];
    
    CGFloat arrowX = kScreenWidth - 50;
    UIImageView *arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(arrowX, helpLabelY, 44, 44)];
    arrowView.image = [UIImage imageNamed:@"rightArrow_Normal"];
    arrowView.contentMode = UIViewContentModeCenter;
    [self.view addSubview:arrowView];
}



#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    D18_ConnectCell *cell = [tableView dequeueReusableCellWithIdentifier:conncetTableIdentifier forIndexPath:indexPath];
    cell.deviceNameLabel.text = @"JINHAO 1";
    cell.macAddressLabel.text = @"mac address";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _programs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    D18_ProgramCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:programCollectionViewIdentifier forIndexPath:indexPath];
    [cell setModel:_programs[indexPath.item]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *tempArray = [NSArray arrayWithArray:_programs];
    for (NSInteger i = 0; i < tempArray.count; i++) {
        D18_ProgramCell *tempCell = (D18_ProgramCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        D18_ProgramModel *tempModel = tempArray[i];
        if (i != indexPath.item) {
            tempModel.isSelected = NO;
        }else{
            tempModel.isSelected = YES;
        }
        [tempCell setModel:tempModel];
        [_programs replaceObjectAtIndex:i withObject:tempModel];
    }
    
    [Utils setProgramArray:_programs];
    
}


- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)linkBluetooth
{
    
}

- (void)helpLabelClick
{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
