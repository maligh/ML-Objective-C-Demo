//
//  MVCViewController.m
//  MVC-MVP-MVVM-VIPER
//
//  Created by mali on 2017/3/22.
//  Copyright © 2017年 mali. All rights reserved.
//

#import "MVCViewController.h"
#import "MVCModel.h"
#import "MVCView.h"

@interface MVCViewController ()

@property (nonatomic, strong) MVCView *subview;
@property (nonatomic, strong) MVCModel *model;

@end

@implementation MVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    MVCModel *model = [[MVCModel alloc] init];
    model.text = @"text";
    self.subview = [MVCView initwithModel:model];
    
    __weak typeof(self)weakSelf = self;
    __weak MVCModel *weakModel = model;
    _subview.buttonClickBlock = ^() {
        weakModel.text = [NSString stringWithFormat:@"%d", rand()];
        weakSelf.subview.model = weakSelf.model;
    };

    [self.view addSubview:_subview];
}



@end
