//
//  NSString+Frame.h
//  ZhiHuiJingJiang_iOS
//
//  Created by 杨森 on 16/6/13.
//  Copyright © 2016年 com.sitemap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Frame)

- (CGFloat)stringHeightWithSize:(CGSize)size font:(UIFont *)font;
- (CGFloat)stringWidthWithSize:(CGSize)size font:(UIFont *)font;

@end
