//
//  ServceVC.m
//  Socket
//
//  Created by yangsen on 16/12/15.
//  Copyright © 2016年 yangsen. All rights reserved.
//

#import "ServceVC.h"

@interface ServceVC ()<UITextFieldDelegate>
{
    ServceSocket *servceSocket;
}
@end
@implementation ServceVC

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.portTF.delegate = self;
    servceSocket = [ServceSocket shareServceSocket];
    
    __weak typeof(self) weakSelf = self;
    servceSocket.stepAction = ^(NSString *message){
        __strong typeof(self) strongSelf = weakSelf;
        if (!weakSelf) {
            return ;
        }
        NSMutableString *mess = [NSMutableString stringWithString:strongSelf.textView.text];
        [mess appendString:[NSString stringWithFormat:@"\r\n%@",message]];
        if ([NSThread currentThread].isMainThread) {
            strongSelf.textView.text = [mess copy];
        }
        else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                strongSelf.textView.text = [mess copy];
            });
        }
    };
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    if (_portTF.text.length) {
        [servceSocket openServceWithPort:textField.text];
    }
    return YES;
}

@end
