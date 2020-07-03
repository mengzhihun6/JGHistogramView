//
//  ZYInMallWelfareDetailController.m
//  WSCollege
//
//  Created by spring on 2020/6/9.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYInMallWelfareDetailController.h"
#import "ZYInMallWelfareDetailTH.h"
#import "ZYInMallWelfareDetailTCell.h"

@interface ZYInMallWelfareDetailController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;


@end

static NSString * const ZYInMallWelfareDetailTCellId = @"ZYInMallWelfareDetailTCellId";

@implementation ZYInMallWelfareDetailController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ZYInMallWelfareDetailTCell class] forCellReuseIdentifier:ZYInMallWelfareDetailTCellId];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"福利币明细";
    
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
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZYInMallWelfareDetailTH *header = [ZYInMallWelfareDetailTH new];
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYInMallWelfareDetailTCell *cell = [tableView dequeueReusableCellWithIdentifier:ZYInMallWelfareDetailTCellId forIndexPath:indexPath];
    return cell;
}

#pragma mark - 点击事件 -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kWidthScale(48);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kWidthScale(330);
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
