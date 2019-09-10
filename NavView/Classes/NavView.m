//
//  NavView.m
//  XgShop
//
//  Created by XIAO on 2018/8/20.
//  Copyright © 2018年 Cocav. All rights reserved.
//

#import "NavView.h"
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
