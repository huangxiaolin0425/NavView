//
//  NavView.h
//  XgShop
//
//  Created by XIAO on 2018/8/20.
//  Copyright © 2018年 Cocav. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol navViewDelegate<NSObject>
@optional
/**
 *导航的返回
 */
- (void)navBackClicked;

/**
 *导航右边备用按钮
 */
- (void)navRightClicked;
@end

@interface NavView : UIView
@property (nonatomic,weak)id<navViewDelegate>delegate;

/**
 初始化自定义导航栏

 @param names 导航栏中心title
 @param color 导航栏背景颜色
 @param image 导航栏左边图片
 @param imager 导航浪右边图片
 @param titles 导航栏右边图片名字
 @param frame 位置
 @param delegate 导航左右图片点击代理
 @return navView
 */
- (id)initWithTitle:(NSString *)names withBgColor:(UIColor *)color withLeftImage:(NSString *)image withRightImage:(NSString *)imager withRighttitle:(NSString *)titles withHiddenLine:(BOOL)hiddenLine theFrame:(CGRect)frame theDelegate:(id<navViewDelegate>)delegate;
@property (nonatomic,strong)NSString *title,*leftimage,*rightimage,*righttitle;
@property (nonatomic,assign)BOOL rightimageShow;
@property (nonatomic,assign)BOOL hiddenLine;
@end
