//
//  ViewController.m
//  NetworkRequest
//
//  Created by lanouhn on 16/4/26.
//  Copyright © 2016年 王国军. All rights reserved.
//

#import "ViewController.h"
#import "NetworkRequestManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
    
}
- (void)requestData {
    [NetworkRequestManager requestWithGetUrl:@"http://api2.pianke.me/read/columns" Pardic:nil success:^(id responseObject) {
        
        
    } err:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
