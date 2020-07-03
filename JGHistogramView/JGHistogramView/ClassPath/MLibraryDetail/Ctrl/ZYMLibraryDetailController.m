//
//  ZYMLibraryDetailController.m
//  WSCollege
//
//  Created by spring on 2020/6/8.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYMLibraryDetailController.h"
#import "ZYMLibraryDetailTH.h"
#import "ZYMLibraryDetailTCell.h"

@interface ZYMLibraryDetailController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString * const ZYMLibraryDetailTCellId = @"ZYMLibraryDetailTCellId";

@implementation ZYMLibraryDetailController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ZYMLibraryDetailTCell class] forCellReuseIdentifier:ZYMLibraryDetailTCellId];
    }
    return _tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"管理员任务积分明细";
    
}


- (void)configUI {
    
    //顶部线
    UIView *TopLine = [[UIView alloc] initWithFrame:CGRectMake(0, SJHeight, kDeviceWidth, 1)];
    TopLine.backgroundColor = JGHexColor(@"#CCCCCC");
    [self.view addSubview:TopLine];
    
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).mas_offset(SJHeight+1);
        make.bottom.equalTo(self.view.mas_bottom).mas_offset(-IphoneXTH);
    }];
}


#pragma mark - <UITableViewDataSource, UITableViewDelegate> -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZYMLibraryDetailTH *header = [ZYMLibraryDetailTH new];
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYMLibraryDetailTCell *cell = [tableView dequeueReusableCellWithIdentifier:ZYMLibraryDetailTCellId forIndexPath:indexPath];
    return cell;
}

#pragma mark - 点击事件 -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kWidthScale(48);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kWidthScale(290);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
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
