//
//  ViewController.m
//  mysharesdk
//
//  Created by Gust on 2017/1/8.
//  Copyright © 2017年 Gust. All rights reserved.
//

#import "ViewController.h"
#import <ShareSDKUI/ShareSDK+SSUI.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor blueColor];
    btn.frame = CGRectMake(20, 30, 100, 30);
    [btn addTarget:self action:@selector(btnAC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}

- (void)btnAC{
     NSArray *imageArray = @[[UIImage imageNamed:@"1.png"]];
    if (imageArray) {
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
//        [shareParams SSDKSetupLineParamsByText:@"分享自己第一张图片" image:imageArray type:SSDKContentTypeAuto];
        [shareParams SSDKSetupShareParamsByText:@"分享自己第一张图片" images:imageArray url:[NSURL URLWithString:@"http://mob.com"] title:@"我的第一张图片" type:SSDKContentTypeAuto];
        [ShareSDK showShareActionSheet:nil items:nil shareParams:shareParams onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
            switch (state) {
                case SSDKResponseStateSuccess:
                {
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"分享成功" message:@"分享的是我的图片" preferredStyle:UIAlertControllerStyleActionSheet];
                    [self presentViewController:alertController animated:YES completion:nil];
                    break;
                }
                case SSDKResponseStateFail:
                {
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"分享失败" message:@"分享的是我的图片" preferredStyle:UIAlertControllerStyleActionSheet];
                    [self presentViewController:alertController animated:YES completion:nil];
                    break;
                }
                    
                default:
                    break;
            }
        }];
    }

}
@end
