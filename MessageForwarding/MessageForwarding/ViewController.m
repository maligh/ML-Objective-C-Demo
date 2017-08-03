//
//  ViewController.m
//  MessageForwarding
//
//  Created by mjpc on 2017/7/29.
//  Copyright © 2017年 mali. All rights reserved.
//

#import "ViewController.h"
#import "People.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    People *people = [[People alloc] init];
    [people performSelector:@selector(speak)];
    [people performSelector:@selector(fly)];
    [people performSelector:@selector(code)];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    People *people = [[People alloc] init];
    [people performSelector:@selector(missMethod)];
}

@end
