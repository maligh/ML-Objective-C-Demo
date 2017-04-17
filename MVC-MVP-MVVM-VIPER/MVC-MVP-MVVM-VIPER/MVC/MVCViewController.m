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
    self.model = [[MVCModel alloc] init];
    [_model setValue:@"Init Text" forKey:@"text"];
    [_model addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    self.subview = [[MVCView alloc] initWithFrame:self.view.bounds];
    _subview.viewText = [_model valueForKey:@"text"];
    [self.view addSubview:_subview];
    
    __weak typeof(self)weakSelf = self;
    _subview.buttonClickBlock = ^() {
        [weakSelf.model setValue:[NSString stringWithFormat:@"%d", rand()] forKey:@"text"];
    };

    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if([keyPath isEqualToString:@"text"]) {
        _subview.viewText = [_model valueForKey:@"text"];
    }
}

- (void)dealloc {
    [_model removeObserver:self forKeyPath:@"text"];
}


@end
