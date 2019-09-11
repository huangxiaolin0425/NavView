//
//  NavView.m
//  XgShop
//
//  Created by XIAO on 2018/8/20.
//  Copyright © 2018年 Cocav. All rights reserved.
//

#import "NavView.h"
#define IS_IPhoneX_All ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)
//#define HYDeviceIsX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define HYDevice_NaviBar_Height     (IS_IPhoneX_All?88:64)
#define HYDevice_StatusBar_Height   (IS_IPhoneX_All?44:20)
#define HYDevice_TabBar_Height      (IS_IPhoneX_All?83:49)
#define HYDevice_SafeArea_BottomHeight (IS_IPhoneX_All?34:0)
#define HYTABBAR_VIEW_HEIGHT
@interface NavView()
@property (nonatomic,strong)UILabel *navtitle;
@property (nonatomic,strong)UILabel *line;
@property (nonatomic,strong)UIImageView *rightImage;

@end
@implementation NavView

- (id)initWithTitle:(NSString *)names withBgColor:(UIColor *)color withLeftImage:(NSString *)image withRightImage:(NSString *)imager withRighttitle:(NSString *)titles withHiddenLine:(BOOL)hiddenLine theFrame:(CGRect)frame theDelegate:(id<navViewDelegate>)delegate{
    self=[super init];
    if(self){
        self.delegate = delegate;
        self.frame = frame;
        self.title = names;
        self.leftimage = image;
        self.rightimage = imager;
        self.righttitle = titles;
        self.hiddenLine = hiddenLine;
        self.backgroundColor = color;
        [self createView:names];
    }
    return self;
}
- (void)createView:(NSString *)title{
    UIView *backBg=[[UIView alloc]init];
    [self addSubview:backBg];
    backBg.frame = CGRectMake(0, HYDevice_NaviBar_Height-44, 60, 44);
    
    UIImageView *backimage=[[UIImageView alloc]init];
    [self addSubview:backimage];
    backimage.image=[UIImage imageNamed:self.leftimage];
    backimage.userInteractionEnabled=YES;
    backimage.bounds = CGRectMake(0, 0, 15, 15);
    backimage.center = backBg.center;
    
    UITapGestureRecognizer *imagetap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backClick:)];
    [backBg addGestureRecognizer:imagetap];
    
    UIView *rightBg=[[UIView alloc]init];
    [self addSubview:rightBg];
    rightBg.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-60, HYDevice_NaviBar_Height-44, 60, 44);
    //    [rightBg mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.bottom.mas_equalTo(self);
    //        make.right.mas_equalTo(self);
    //        make.height.mas_equalTo(44);
    //        make.width.mas_equalTo(50);
    //    }];
    UIImageView *rightimage=[[UIImageView alloc]init];
    UIButton *rightbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [rightbtn setTitle:self.righttitle forState:UIControlStateNormal];
    [rightbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rightbtn.layer.cornerRadius=0;
    rightbtn.layer.masksToBounds=YES;
    
    
    // 当导航栏右边title有值时即表示是：文本按钮
    // 当导航栏右边image有值时即表示是：图片按钮
    
    if(self.righttitle.length>0){
        [rightbtn addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:rightbtn];
        rightbtn.bounds = CGRectMake(0, 0, 44, 44);
        rightbtn.center = rightBg.center;
        //        [rightbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.right.mas_equalTo(self).offset(-5);
        //            make.width.height.mas_equalTo(44);
        //            make.centerY.mas_equalTo(backimage);
        //
        //        }];
    }else if(self.rightimage.length>0){
        [self addSubview:rightimage];
        self.rightImage=rightimage;
        UITapGestureRecognizer *imageRight=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(rightClick)];
        [rightBg addGestureRecognizer:imageRight];
        rightimage.userInteractionEnabled=YES;
        rightimage.image=[UIImage imageNamed:self.rightimage];
        rightimage.bounds = CGRectMake(0, 0, 20, 20);
        rightimage.center = rightBg.center;
        //        [rightimage mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.right.mas_equalTo(self).offset(-15);
        //            make.width.height.mas_equalTo(20);
        //            make.centerY.mas_equalTo(backimage);
        //
        //        }];
    }
    
    //     导航栏中间title
    
    
    UILabel *label=[[UILabel alloc]init];
    [self addSubview:label];
    label.textColor=[UIColor blackColor];
    label.font=[UIFont systemFontOfSize:17];
    label.text=self.title;
    label.textAlignment=NSTextAlignmentCenter;
    self.navtitle=label;
    label.frame = CGRectMake(80, 0, [UIScreen mainScreen].bounds.size.width-160, 20);
    label.center = CGPointMake(self.center.x, backBg.center.y);
    //    [label mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.mas_equalTo(80);
    //        make.height.mas_equalTo(20);
    //        make.bottom.mas_equalTo(self).mas_offset(-12);
    //        make.right.mas_equalTo(-80);
    //    }];
    
    self.line=[[UILabel alloc]init];
    self.line.backgroundColor=[UIColor grayColor];
    [self addSubview:self.line];
    self.line.frame = CGRectMake(0, HYDevice_NaviBar_Height-0.5, [UIScreen mainScreen].bounds.size.width, 0.5);
    //    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.right.bottom.mas_equalTo(self);
    //        make.height.mas_equalTo(0.5);
    //    }];
    
    self.line.hidden = self.hiddenLine;
    
}

- (void)backClick:(UITapGestureRecognizer *)sender{
    if (self.delegate &&[self.delegate respondsToSelector:@selector(navBackClicked)]) {
        [self.delegate navBackClicked];
    }
}
- (void)rightClick{
    if(self.rightimageShow||self.righttitle.length>0){
        if (self.delegate &&[self.delegate respondsToSelector:@selector(navRightClicked)]) {
            [self.delegate navRightClicked];
        }
    }
}
- (void)setTitle:(NSString *)title{
    _title=title;
    self.navtitle.text=_title;
}
- (void)setRightimageShow:(BOOL)rightimageShow{
    _rightimageShow=rightimageShow;
    if(_rightimageShow){
        self.rightImage.hidden=NO;
    }else{
        self.rightImage.hidden=YES;
    }
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
