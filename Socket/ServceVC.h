//
//  ServceVC.h
//  Socket
//
//  Created by yangsen on 16/12/15.
//  Copyright © 2016年 yangsen. All rights reserved.
//

#import "BaseVC.h"
#import "ServceSocket.h"

@interface ServceVC : BaseVC

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *hostTF;
@property (weak, nonatomic) IBOutlet UITextField *portTF;

@end
