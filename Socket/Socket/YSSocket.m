//
//  Socket.m
//  Socket
//
//  Created by yangsen on 16/12/15.
//  Copyright © 2016年 yangsen. All rights reserved.
//

#import "YSSocket.h"

@implementation YSSocket

- (instancetype)init{
    if (self = [super init]) {
        _asyncSocket = [[AsyncSocket alloc]initWithDelegate:self];
    }
    return self;
}

@end
