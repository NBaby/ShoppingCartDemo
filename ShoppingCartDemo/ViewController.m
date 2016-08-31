//
//  ViewController.m
//  ShoppingCartDemo
//
//  Created by nuomi on 16/8/28.
//  Copyright © 2016年 nuomi. All rights reserved.
//

#import "ViewController.h"
#import "NMShoppongCartDemoController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tap:(id)sender {
    NMShoppongCartDemoController * controller =[[NMShoppongCartDemoController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
