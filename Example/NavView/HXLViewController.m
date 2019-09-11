//
//  HXLViewController.m
//  NavView
//
//  Created by huangxiaolin0425 on 09/10/2019.
//  Copyright (c) 2019 huangxiaolin0425. All rights reserved.
//

#import "HXLViewController.h"
#import "NavView.h"
#define IS_IPhoneX_All ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)
//#define HYDeviceIsX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define HYDevice_NaviBar_Height     (IS_IPhoneX_All?88:64)

@interface HXLViewController ()<navViewDelegate>
@property (nonatomic,strong)NavView *navView;
@end

@implementation HXLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.navView];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NavView *)navView{
    if (!_navView){
        _navView = [[NavView alloc]initWithTitle:@"首页" withBgColor:[UIColor redColor] withLeftImage:@"" withRightImage:@"" withRighttitle:@"保存" withHiddenLine:NO theFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,HYDevice_NaviBar_Height) theDelegate:self];
    }
    return _navView;
}
#pragma mark --navdelegate 返回代理
- (void)navBackClicked{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
