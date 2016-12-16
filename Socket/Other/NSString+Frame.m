//
//  NSString+Frame.m
//  ZhiHuiJingJiang_iOS
//
//  Created by 杨森 on 16/6/13.
//  Copyright © 2016年 com.sitemap. All rights reserved.
//

#import "NSString+Frame.h"

@implementation NSString (Frame)

- (CGFloat)stringHeightWithSize:(CGSize)size font:(UIFont *)font
{
    return [self stringSizeWithSize:size font:font].height;
}

- (CGFloat)stringWidthWithSize:(CGSize)size font:(UIFont *)font{

    return [self stringSizeWithSize:size font:font].width;
}

- (CGSize)stringSizeWithSize:(CGSize)size font:(UIFont *)font{
    
    NSDictionary *attribute = @{NSFontAttributeName: font};
    CGSize retSize = [self boundingRectWithSize:size
                                        options:
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    
    return retSize;
}

@end
