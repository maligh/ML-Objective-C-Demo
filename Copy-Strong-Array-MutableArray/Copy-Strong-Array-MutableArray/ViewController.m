//
//  ViewController.m
//  Copy-Strong-Array-MutableArray
//
//  Created by mali on 2017/3/15.
//  Copyright © 2017年 mali. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *arrayOfStrong;
@property (nonatomic, copy) NSArray *arrayOfCopy;
@property (nonatomic, copy) NSArray *arrayOfCopy2;
@property (nonatomic, strong) NSMutableArray *mutableArrayOfStrong;
@property (nonatomic, copy) NSMutableArray *mutableArrayOfCopy;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithArray:@[@"A"]];
    NSLog(@"mutableArray地址为 %p", mutableArray);
    self.arrayOfStrong = mutableArray;
    self.arrayOfCopy = mutableArray;
    _arrayOfCopy2 = mutableArray;
    
    [mutableArray addObject:@"B"];
    NSLog(@"arrayOfStrong:%@ 地址为%p",_arrayOfStrong, _arrayOfStrong);
    NSLog(@"arrayOfCopy:%@ 地址为%p",_arrayOfCopy, _arrayOfCopy);
    NSLog(@"arrayOfCopy2:%@ 地址为%p", _arrayOfCopy2, _arrayOfCopy2);
    
    
    NSLog(@"------------------------------------------------------");
    
    self.mutableArrayOfStrong = mutableArray;
    [_mutableArrayOfStrong addObject:@"C"];
    
    self.mutableArrayOfCopy = mutableArray;

    NSLog(@"mutableArrayOfStrong:%@ 地址为%p",_mutableArrayOfStrong, _mutableArrayOfStrong);
    NSLog(@"mutableArrayOfCopy's class is %@", [_mutableArrayOfCopy class]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //crash
    [_mutableArrayOfCopy addObject:@"C"];
}


@end
