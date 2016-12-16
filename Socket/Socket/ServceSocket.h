//
//  ServceSocket.h
//  Socket
//
//  Created by yangsen on 16/12/15.
//  Copyright © 2016年 yangsen. All rights reserved.
//

#import "YSSocket.h"

@interface ServceSocket : YSSocket

+ (id)shareServceSocket;

- (void)openServceWithPort:(NSString *)port;

@end
