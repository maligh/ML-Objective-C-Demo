//
//  ViewController.m
//  MutablCopy-Property
//
//  Created by MaLi on 2017/3/14.
//  Copyright © 2017年 mali. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *arrayOfStrong;
@property (nonatomic, copy) NSArray *arrayOfCopy;
@property (nonatomic, strong) NSMutableArray *mutableArrayOfStrong;
@property (nonatomic, copy) NSMutableArray *mutableArrayOfCopy;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@"A"]];
    self.arrayOfStrong = array;
    self.arrayOfCopy = array;
    [array addObject:@"B"];
    NSLog(@"arrayOfStrong:%@ %p",_arrayOfStrong);
    NSLog(@"arrayOfCopy:%@",_arrayOfCopy);
    
    
}




@end
