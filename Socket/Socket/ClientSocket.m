//
//  ClientSocket.m
//  Socket
//
//  Created by yangsen on 16/12/15.
//  Copyright © 2016年 yangsen. All rights reserved.
//

#import "ClientSocket.h"

@interface ClientSocket()<AsyncSocketDelegate>
{
    NSString  *_host;
    NSInteger  _port;
}

@end
@implementation ClientSocket

static ClientSocket *clientSocket = nil;
+ (id)shareClientSocket{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        clientSocket = [[ClientSocket alloc]init];
    });
    return clientSocket;
}

- (AsyncSocket *)startToConnectToHost:(NSString *)host port:(NSString *)port timeOut:(NSInteger)timeOut{
    
    [self.asyncSocket disconnect];
    NSError *error;
    [self.asyncSocket connectToHost:host onPort:port.integerValue withTimeout:timeOut error:&error];
    
    NSLog(@"clientError: %@",error.description);
    _host = host;
    _port = port.integerValue;
    return self.asyncSocket;
}

- (void)sendMessageToSerce:(NSString *)message{
    
    NSData *messageData = [message dataUsingEncoding:NSUTF8StringEncoding];
    [self.asyncSocket writeData:messageData withTimeout:-1 tag:0];
}

#pragma  mark --- socket 代理 --

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port{
    if (self.stepAction) {
        self.stepAction(@"已经连接到服务器端");
    }
    [sock readDataWithTimeout:-1 tag:0];
}

- (void)onSocketDidDisconnect:(AsyncSocket *)sock{
    if (self.stepAction) {
        self.stepAction(@"已经与服务器端断开连接");
    }
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
}

- (void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag{
    if (self.stepAction) {
        self.stepAction(@"客户端传出数据");
    }
}
@end
