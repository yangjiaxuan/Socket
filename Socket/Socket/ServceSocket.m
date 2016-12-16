//
//  ServceSocket.m
//  Socket
//
//  Created by yangsen on 16/12/15.
//  Copyright © 2016年 yangsen. All rights reserved.
//

#import "ServceSocket.h"
#import <GCDAsyncSocket.h>

@interface ServceSocket()<AsyncSocketDelegate>
{
    AsyncSocket    *_servceAsyncSocket;
    NSMutableArray *_asyncSocketArr;
    
}

@end
@implementation ServceSocket

static ServceSocket *servceSocket = nil;
+ (id)shareServceSocket{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        servceSocket = [[ServceSocket alloc]init];
    });
    return servceSocket;
}

- (instancetype)init{
    if (self = [super init]) {
        _asyncSocketArr = [NSMutableArray array];
    }
    return self;
}

- (void)openServceWithPort:(NSString *)port{

    [self.asyncSocket disconnect];
    NSError *error;
    [self.asyncSocket acceptOnPort:port.integerValue error:&error];
    NSLog(@"servce:%@",error.description);
}

#pragma  mark --- socket 代理 --

/**
 当有设备连接时调用
 */
- (void)onSocket:(AsyncSocket *)sock didAcceptNewSocket:(AsyncSocket *)newSocket
{
    
    [_asyncSocketArr addObject:newSocket];
    if (self.stepAction) {
        self.stepAction(@"已经进行监听端口");
    }
    [newSocket readDataWithTimeout:-1 tag:0];
}

- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    if (self.stepAction) {
        self.stepAction(@"已经接收到数据");
    }
    NSString *message = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"传递的message%@",message);
    if (self.stepAction) {
        self.stepAction([NSString stringWithFormat:@"接收到的数据是：%@",message]);
    }
    [sock readDataWithTimeout:-1 tag:0];
}


@end
