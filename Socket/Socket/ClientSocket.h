//
//  ClientSocket.h
//  Socket
//
//  Created by yangsen on 16/12/15.
//  Copyright © 2016年 yangsen. All rights reserved.
//

#import "YSSocket.h"

@interface ClientSocket : YSSocket

+ (id)shareClientSocket;

- (AsyncSocket *)startToConnectToHost:(NSString *)host port:(NSString *)port timeOut:(NSInteger)timeOut;
- (void)sendMessageToSerce:(NSString *)message;

@end
