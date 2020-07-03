//
//  ViewController.m
//  JGHistogramView
//
//  Created by spring on 2020/7/3.
//  Copyright © 2020 spring. All rights reserved.
//

#import "JGRootViewController.h"
#import "JGRootViewTCell.h"

#import "ZYMyIntegralDetailController.h" //积分明细
#import "ZYInMallWelfareDetailController.h"//福利币明细
#import "ZYMLibraryDetailController.h"//管理员任务积分明细


@interface JGRootViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *DataArrM;

@end

static NSString * const JGRootViewTCellId = @"JGRootViewTCellId";


@implementation JGRootViewController

- (NSArray *)DataArrM {
    if (!_DataArrM) {
        _DataArrM = @[@"积分明细",@"福利币明细",@"管理员任务积分明细"];
    }
    return _DataArrM;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[JGRootViewTCell class] forCellReuseIdentifier:JGRootViewTCellId];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"柱状图";
    
    [self configUI];
}

- (void)configUI {
    
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).mas_offset(SJHeight+0.5);
        make.bottom.equalTo(self.view.mas_bottom).mas_offset(-IphoneXTH);
    }];
}

#pragma mark - <UITableViewDataSource, UITableViewDelegate> -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.DataArrM.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JGRootViewTCell *cell = [tableView dequeueReusableCellWithIdentifier:JGRootViewTCellId forIndexPath:indexPath];
    cell.TitleLbl.text = [self.DataArrM objectAtIndex:indexPath.row];
    return cell;
}


#pragma mark - 点击事件 -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {//积分明细
        
        ZYMyIntegralDetailController *VC = [ZYMyIntegralDetailController new];
        [self.navigationController pushViewController:VC animated:YES];
    }else if (indexPath.row == 1) {//福利币明细
        
        ZYInMallWelfareDetailController *VC = [ZYInMallWelfareDetailController new];
        [self.navigationController pushViewController:VC animated:YES];
    }else if (indexPath.row == 2) {//管理员任务积分明细
     
        ZYMLibraryDetailController *VC = [ZYMLibraryDetailController new];
        [self.navigationController pushViewController:VC animated:YES];
    }
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kWidthScale(48);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}




@end
