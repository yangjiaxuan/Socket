//
//  BaseVC.h
//  ZhiHuiJingJiang_iOS
//
//  Created by 杨森 on 16/4/25.
//  Copyright © 2016年 com.sitemap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseVC : UIViewController

@property (strong, nonatomic, readonly) NSArray *leftNavBtns;
@property (strong, nonatomic, readonly) NSArray *rightNavBtns;

- (void)addNavigationBarLeftBtn;
- (void)addNavigationBarRightBtnWithImageName:(NSString *)imageName;
- (void)addNavigationBarRightBtnWithText:(NSString *)text;

- (void)addNavigationBarLeftBtnsWithImageNames:(NSArray *)leftImageNames;
- (void)addNavigationBarRightBtnsWithImageNames:(NSArray *)rightImageNames;
- (void)addNavigationBarLeftBtnsWithImageNames:(NSArray *)leftImageNames leftBtnsAWithText:(NSArray *)leftTexts;
- (void)addNavigationBarRightBtnsWithImageNames:(NSArray *)rightImageNames rightBtnsWithText:(NSArray *)rightTexts;

- (void)leftNavBarButtonClick:(UIButton *)sender;
- (void)rightNavBarButtonClick:(UIButton *)sender;

+ (id)controller;


@end
