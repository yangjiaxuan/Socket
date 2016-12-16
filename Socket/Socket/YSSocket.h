//
//  Socket.h
//  Socket
//
//  Created by yangsen on 16/12/15.
//  Copyright © 2016年 yangsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AsyncSocket.h>

typedef void (^StepAction)(NSString *string);

@interface YSSocket : NSObject

@property (copy, nonatomic) StepAction stepAction;

@property (strong, nonatomic) AsyncSocket *asyncSocket;

@end
