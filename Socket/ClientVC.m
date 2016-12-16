//
//  ClientVC.m
//  Socket
//
//  Created by yangsen on 16/12/15.
//  Copyright © 2016年 yangsen. All rights reserved.
//

#import "ClientVC.h"
#import "ClientSocket.h"

@interface ClientVC ()<UITextFieldDelegate>
{
    ClientSocket *clientSocket;
}
@end
@implementation ClientVC

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.portTF.delegate = self;
    
    clientSocket = [ClientSocket shareClientSocket];
    __weak typeof(self) weakSelf = self;
    clientSocket.stepAction = ^(NSString *message){
        
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf addStringToTextViewText:message];
    };
}

- (void)addStringToTextViewText:(NSString *)string{
    
    NSMutableString *mess = [NSMutableString stringWithString:self.textView.text?:@""];
    [mess appendString:[NSString stringWithFormat:@"\r\n%@",string]];
    if ([NSThread currentThread].isMainThread) {
        self.textView.text = [mess copy];
    }
    else{
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.textView.text = [mess copy];
        });
    }
    
}

- (IBAction)senderAction:(UIButton *)sender {
    
    if (_messageTF.text.length) {
        
        [self addStringToTextViewText:_messageTF.text];
        [clientSocket sendMessageToSerce:_messageTF.text];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (_hostTF.text.length && _portTF.text.length) {
        
        [clientSocket startToConnectToHost:_hostTF.text port:_portTF.text timeOut:-1];
    }
    return YES;
}



@end
