//
//  ViewController.m
//  deploygate-ios-sdk-sample
//
//  Created by kenta.imai on 2015/08/26.
//  Copyright (c) 2015年 DeployGate. All rights reserved.
//

#import "ViewController.h"
#import <DeployGateSDK/DeployGateSDK.h>

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *dataSourceKey;
@property (nonatomic, strong) NSMutableDictionary *dataSource;

@end

@implementation ViewController

NSString * const kAuthorize = @"Authorize";
NSString * const kSdkVersion = @"SDK Version";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DGSLog(@"%@", @"DGLog test message");
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.dataSourceKey = @[kAuthorize, kSdkVersion];
    self.dataSource = [@{
                        kAuthorize: @"",
                        kSdkVersion: [DeployGateSDK version]
                        } mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger dataCount;
    
    switch (section) {
        case 0:
            dataCount = self.dataSourceKey.count;
            break;
        default:
            break;
    }
    return dataCount;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:CellIdentifier];
    }
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = self.dataSourceKey[indexPath.row];
            cell.detailTextLabel.text = self.dataSource[self.dataSourceKey[indexPath.row]];
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell.textLabel.text isEqualToString:kAuthorize]) {
        [[DeployGateSDK sharedInstance] userAuthorizationWithCompletionHandler:^(BOOL authorized, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[[UIAlertView alloc] initWithTitle:@"Authorize"
                                            message:authorized ? @"Success" : @"Failed"
                                           delegate:nil
                                  cancelButtonTitle:nil
                                  otherButtonTitles:@"OK", nil] show];
            });
        }];
    }
    cell.selected = NO;
}

@end
