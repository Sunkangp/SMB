//
//  ViewController.m
//  SMB
//
//  Created by sunkang on 2018/11/1.
//  Copyright © 2018年 sunkang. All rights reserved.
//

#import "ViewController.h"
#import "TOSMBClient.h"


@interface ViewController ()

@property (nonatomic, strong, null_resettable) TOSMBSession *session;

@end

@implementation ViewController

- (TOSMBSession *)session {
    if (!_session) {
        _session = [[TOSMBSession alloc] initWithIPAddress:@"10.0.1.81"];

        [_session setLoginCredentialsWithUserName:@"username" password:@"password"];
    }
    return _session;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSString *path = [NSString stringWithFormat:@"/sunkang/Desktop/name.text"];//服务器路径
    
    NSString *txtPath = [[NSBundle mainBundle] pathForResource:@"sun_kang" ofType:@"rtf"];
    NSData *data = [[NSData alloc]initWithContentsOfFile:txtPath];//需要上传的文件转data
    
    TOSMBSessionUploadTask *uploadTask = [self.session uploadTaskForFileAtPath:path data:data progressHandler:nil completionHandler:^{
        //ok
        
    } failHandler:^(NSError *error) {
        //no
    }];
    
    [uploadTask resume];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}


@end
