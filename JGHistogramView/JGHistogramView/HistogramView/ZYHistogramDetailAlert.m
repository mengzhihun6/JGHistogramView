//
//  ZYHistogramDetailAlert.m
//  WSCollege
//
//  Created by spring on 2020/5/30.
//  Copyright © 2020 JG. All rights reserved.
//

#import "ZYHistogramDetailAlert.h"


@interface HistogramDetailAlertCell : ZYBaseView

@property (nonatomic, strong) UIView *DotView;

@property (nonatomic, strong) UILabel *TitleLbl;

@property (nonatomic, strong) UILabel *InfoLbl;

@end

@implementation HistogramDetailAlertCell

- (void)configUI {
    
    _DotView = [UIView new];
    _DotView.backgroundColor = JGRandomColor;
    _DotView.layer.cornerRadius = kWidthScale(2);
    _DotView.clipsToBounds = YES;
    
    _TitleLbl = [UILabel new];
    _TitleLbl.textColor = JGHexColor(@"#505050");
    _TitleLbl.font = JGFont(kWidthScale(10));
    _TitleLbl.text = @"积分";
    
    _InfoLbl = [UILabel new];
    _InfoLbl.textColor = JGHexColor(@"#505050");
    _InfoLbl.font = JGFont(kWidthScale(10));
    _InfoLbl.text = @"5";
    
    
    [self addSubview:_DotView];
    [self addSubview:_TitleLbl];
    [self addSubview:_InfoLbl];
    
    
    [_DotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(5);
        make.centerY.equalTo(self.mas_centerY);
        make.width.height.equalTo(@(kWidthScale(4)));
    }];
    
    [_TitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(_DotView.mas_right).mas_offset(3);
    }];
    
    [_InfoLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right).mas_offset(-8);
    }];
}

@end



@interface ZYHistogramDetailAlert ()<UIGestureRecognizerDelegate>

/** 弹窗 */
@property(nonatomic,strong) UIView *alertView;
//标题
@property(nonatomic,strong) UILabel *TitleLbl;

@property(nonatomic,strong) UIView *TotalView;
@property (nonatomic, strong) NSMutableArray *ViewArrM;

@end

@implementation ZYHistogramDetailAlert

- (NSMutableArray *)ViewArrM {
    if (!_ViewArrM) {
        _ViewArrM = [NSMutableArray array];
    }
    return _ViewArrM;
}



- (instancetype)initWithArray:(NSArray *)array LocationRect:(CGRect)rect {
    if (self = [super init]) {
        
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor clearColor];
        
        CGSize size = CGSizeZero;
        CGFloat X = 0;
        CGFloat Y = 0;
        if (array.count == 1) {
            size = CGSizeMake(kWidthScale(74), kWidthScale(38));
            X = rect.origin.x + rect.size.width / 2;
            Y = rect.origin.y + 20;
        }else {
            size = CGSizeMake(kWidthScale(74), kWidthScale(52));
            X = rect.origin.x + rect.size.width / 2;
            Y = rect.origin.y + 20;
        }
        
        //        JGLog(@"===: %@", NSStringFromCGRect(rect));
        //        CGFloat maxY = rect.origin.y + rect.size.height;
        //        CGFloat maxAY = rect.origin.y + size.height;
        
        //柱状图的高度小于alert的高度 反向
        if ((rect.size.height - 20) <= size.height) {
            Y = rect.origin.y - size.height; //Y轴反向
        }
        
        //柱状图的最大X + alert的宽度大于屏幕宽度 反向
        if (X + size.width >= kDeviceWidth) {
            X -= size.width; //X轴反向
        }
        
        
        
        _alertView = [UIView new];
        _alertView.backgroundColor = [UIColor whiteColor];
        _alertView.layer.shadowColor = JGHexColor(@"#CCCCCC").CGColor;
        _alertView.layer.shadowOffset = CGSizeMake(0,1);
        _alertView.layer.shadowOpacity = 1;
        _alertView.layer.shadowRadius = 3;
        _alertView.layer.cornerRadius = 5;
        
        _TitleLbl = [UILabel new];
        _TitleLbl.textColor = JGHexColor(@"#505050");
        _TitleLbl.font = JGFont(kWidthScale(10));
        _TitleLbl.text = @"10.12";
        
        _TotalView = [UIView new];
        
        
        [self addSubview:_alertView];
        [_alertView addSubview:_TitleLbl];
        [_alertView addSubview:_TotalView];
        
        
        [_alertView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(X);
            make.top.equalTo(self.mas_top).mas_offset(Y);
            make.size.mas_equalTo(size);
        }];
        
        [_TitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_alertView.mas_left).mas_offset(5);
            make.top.equalTo(_alertView.mas_top);
            make.height.equalTo(@(kWidthScale(20)));
        }];
        
        [_TotalView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(_alertView);
            make.top.equalTo(_TitleLbl.mas_bottom);
        }];
        
        
        for (NSInteger i = 0; i < array.count; i++) {
            
            HistogramDetailAlertCell *YValueDotLine = [HistogramDetailAlertCell new];
            
            [_TotalView addSubview:YValueDotLine];
            
            [self.ViewArrM addObject:YValueDotLine];
            
            YValueDotLine.sd_layout.heightIs(kWidthScale(15));
        }
        
        [_TotalView setupAutoMarginFlowItems:self.ViewArrM withPerRowItemsCount:1 itemWidth:size.width verticalMargin:0 verticalEdgeInset:0 horizontalEdgeInset:0];
        
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
//        tap.numberOfTouchesRequired = 1;
//        tap.delegate = self;
//        [self addGestureRecognizer:tap];
        
    }
    return self;
}

#pragma mark - UIGestureRecognizerDelegate
//    // 若为UITableViewCellContentView（即点击了UIView），则不截获Touch事件
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    //    JGLog(@"%@", NSStringFromClass([touch.view class]));
    return ![NSStringFromClass([touch.view class]) isEqualToString:@"UIView"];
}



- (void)tapClick:(UITapGestureRecognizer *)tap {
    
    //    JGLog(@"%@", [tap.view class]);
    [self hide];
}



#pragma mark - 弹出
-(void)show
{
    UIWindow *rootWindow = [UIApplication sharedApplication].keyWindow;
    [rootWindow addSubview:self];
    //    [self creatShowAnimation];
}

-(void)creatShowAnimation {
    self.alertView.layer.position = self.center;
    self.alertView.transform = CGAffineTransformMakeScale(0.90, 0.90);
    [UIView animateWithDuration:0.25 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
        self.alertView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
        
    }];
}

-(void)hide {
    
    [self removeFromSuperview];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
