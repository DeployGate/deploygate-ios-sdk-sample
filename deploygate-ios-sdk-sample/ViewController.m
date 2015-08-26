//
//  ViewController.m
//  deploygate-ios-sdk-sample
//
//  Created by kenta.imai on 2015/08/26.
//  Copyright (c) 2015年 kenta.imai. All rights reserved.
//

#import "ViewController.h"
#import <DeployGateSDK/DeployGateSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DGSLog(@"%@", @"DGLog test message");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
