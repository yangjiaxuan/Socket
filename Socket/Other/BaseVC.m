//
//  BaseVC.m
//  ZhiHuiJingJiang_iOS
//
//  Created by 杨森 on 16/4/25.
//  Copyright © 2016年 com.sitemap. All rights reserved.
//

#import "BaseVC.h"
#import "NSString+Frame.h"

@interface BaseVC ()
{

    NSMutableArray *_leftNavBtnArr;
    NSMutableArray *_rightNavBtnArr;
}
@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSArray *)getArrWithCount:(NSInteger )count{

    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i < count; i ++) {
        [arr addObject:@""];
    }
    return [arr copy];
}

- (void)addNavigationBarLeftBtnsWithImageNames:(NSArray *)leftImageNames{

    [self addNavigationBarLeftBtnsWithImageNames:leftImageNames leftBtnsAWithText:nil];
}

- (void)addNavigationBarRightBtnsWithImageNames:(NSArray *)rightImageNames{

    [self addNavigationBarRightBtnsWithImageNames:rightImageNames rightBtnsWithText:nil];
}

- (void)addNavigationBarLeftBtnsWithImageNames:(NSArray *)leftImageNames leftBtnsAWithText:(NSArray *)leftTexts{

    [self addNavigationBarLeftBtnsWithImageNames:leftImageNames?leftImageNames:[self getArrWithCount:leftTexts.count] leftBtnsAWithText:leftTexts?leftTexts:[self getArrWithCount:leftImageNames.count] rightBtnsWithImageNames:nil rightBtnsWithText:nil];
}

- (void)addNavigationBarRightBtnsWithImageNames:(NSArray *)rightImageNames rightBtnsWithText:(NSArray *)rightTexts{

    [self addNavigationBarLeftBtnsWithImageNames:nil leftBtnsAWithText:nil rightBtnsWithImageNames:rightImageNames?rightImageNames:[self getArrWithCount:rightTexts.count] rightBtnsWithText:rightTexts?rightTexts:[self getArrWithCount:rightImageNames.count]];
}

- (void)addNavigationBarLeftBtnsWithImageNames:(NSArray *)leftImageNames leftBtnsAWithText:(NSArray *)leftTexts rightBtnsWithImageNames:(NSArray *)rightImageNames rightBtnsWithText:(NSArray *)rightTexts{

    NSInteger leftItemCount = leftImageNames.count < leftTexts.count ? leftImageNames.count:leftTexts.count;
    if (leftItemCount) {
        NSMutableArray *_leftNavBarItems = [NSMutableArray array];
        for (NSInteger i = 0; i < leftItemCount; i ++ ) {
            
            [_leftNavBarItems addObject:
               [self addNavigationBarBtnWithTitle:[leftTexts[i] isEqualToString:@""]?nil:leftTexts[i]
               imageName:[leftImageNames[i] isEqualToString:@""]?nil:leftImageNames[i]
               tag:i+1 isLeft:YES]];
            
        }
        self.navigationItem.leftBarButtonItems = _leftNavBarItems;
    }
    
    NSInteger rightItemCount = rightImageNames.count < rightTexts.count ? rightImageNames.count:rightTexts.count;
    if (rightItemCount) {
        NSMutableArray *_rightNavBarItems = [NSMutableArray array];
        for (NSInteger i = 0; i < rightItemCount; i ++ ) {
            
            [_rightNavBarItems addObject:[self addNavigationBarBtnWithTitle:[rightTexts[i] isEqualToString:@""]?nil:rightTexts[i] imageName:[rightImageNames[i] isEqualToString:@""]?nil:rightImageNames[i] tag:i+1 isLeft:NO]];
            
        }
        self.navigationItem.rightBarButtonItems = _rightNavBarItems;
    }

}

//- (void)addNavigationBarBtnWithAction:(SEL)action title:(NSString *)title nomalImageName:(NSString *)nomalImageName selectedImageName:(NSString *)selectedImageName isLeft:(BOOL)isLeft{
//    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(0, 0, 40, 20);
//    [btn setBackgroundImage:[[UIImage imageNamed:nomalImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
//    [btn setBackgroundImage:[[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
//    [btn setTitle:title forState:UIControlStateNormal];
//    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
//    [btn setBackgroundColor:[UIColor redColor]];
//    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
//    if (isLeft) {
//        self.navigationItem.leftBarButtonItem = barButtonItem;
//    }
//    else{
//        self.navigationItem.rightBarButtonItem = barButtonItem;
//    }
//}

- (void)addNavigationBarLeftBtn{
    
    [self addNavigationBarBtnWithTitle:nil imageName:@"nav_back" isLeft:YES];
    
}

- (void)addNavigationBarRightBtnWithImageName:(NSString *)imageName{
    
    [self addNavigationBarBtnWithTitle:nil imageName:imageName isLeft:NO];
    
}

- (void)addNavigationBarRightBtnWithText:(NSString *)text{
    
    [self addNavigationBarBtnWithTitle:text imageName:nil isLeft:NO];
}

- (void)addNavigationBarBtnWithTitle:(NSString *)title imageName:(NSString *)imageName isLeft:(BOOL)isLef
{
    UIBarButtonItem *barButtonItem = [self addNavigationBarBtnWithTitle:title imageName:imageName tag:1 isLeft:isLef];
    if (isLef) {
        self.navigationItem.leftBarButtonItem = barButtonItem;
    }
    else{

        self.navigationItem.rightBarButtonItem = barButtonItem;
    }
}

- (UIBarButtonItem *)addNavigationBarBtnWithTitle:(NSString *)title imageName:(NSString *)imageName tag:(NSInteger)tag isLeft:(BOOL)isLef {

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = tag;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    if (title&&imageName) {
        UIImageView *btnImage = [[UIImageView alloc]init];
        UILabel *btnLabel = [[UILabel alloc]init];
        btnLabel.textColor = [UIColor blackColor];
        btn.frame = CGRectMake(0, 0, 55, 30);
        btnImage.frame = CGRectMake(0, 3, 12, 24);
        btnLabel.frame = CGRectMake(12, 5, 40, 20);
        btnImage.image = [UIImage imageNamed:imageName];
        [btn addSubview:btnImage];
        btnLabel.text  = title;
        [btn addSubview:btnLabel];
    }
    else if(title){
        
        CGFloat btnW = [title stringWidthWithSize:CGSizeMake(1000, 30) font:[UIFont systemFontOfSize:17]] + 2;
        [btn setTitle:title forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, btnW, 30);
    }
    else if (imageName){
        btn.frame = CGRectMake(0, 0, 20, 20);
        [btn setBackgroundImage:[[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        if (isLef) {
            btn.frame = CGRectMake(0, 3, 12, 24);
        }
    }
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    if (isLef) {
        [btn addTarget:self action:@selector(leftNavBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_leftNavBtnArr addObject: btn];
        _leftNavBtns = _leftNavBtnArr;
    }
    else{
        [btn addTarget:self action:@selector(rightNavBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_rightNavBtnArr addObject: btn];
        _rightNavBtns = _rightNavBtnArr;
    }
    return barButtonItem;
}
- (void)leftNavBarButtonClick:(UIButton *)sender{

    if (sender.tag == 1) {
        if (self.navigationController.viewControllers.count > 1) {
            [self.navigationController popViewControllerAnimated:YES];
        }
        else{
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

- (void)rightNavBarButtonClick:(UIButton *)sender{
    
}

+ (id)controller{

    return nil;
}


@end
