//
//  SendLogViewController.m
//  deploygate-ios-sdk-sample
//
//  Created by kenta.imai on 2015/08/26.
//  Copyright (c) 2015年 DeployGate. All rights reserved.
//

#import "SendLogViewController.h"
#import <DeployGateSDK/DeployGateSDK.h>

@interface SendLogViewController ()
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation SendLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendLog:(UIBarButtonItem *)sender {
    NSString *text = self.textView.text;
    self.textView.text = @"";
    DGSLog(@"%@", text);

    [[[UIAlertView alloc] initWithTitle:@"DGSLog Done"
                                message:@"Require relaunch app"
                               delegate:self
                      cancelButtonTitle:@"Continue"
                      otherButtonTitles:@"Relaunch", nil] show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
        [[UIApplication sharedApplication] performSelector:@selector(terminateWithSuccess)];
#pragma clang diagnostic pops
    }
}

@end
