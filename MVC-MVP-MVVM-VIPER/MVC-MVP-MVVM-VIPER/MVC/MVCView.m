//
//  MVCView.m
//  MVC-MVP-MVVM-VIPER
//
//  Created by mali on 2017/3/22.
//  Copyright © 2017年 mali. All rights reserved.
//

#import "MVCView.h"

@interface MVCView()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *button;

@end

@implementation MVCView

+ (instancetype)initwithModel:(MVCModel *)model {
    MVCView *view = [[MVCView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.model = model;
    return view;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.label = [[UILabel alloc] init];
    _label.frame = CGRectMake(100, 100, 100, 30);
    [self addSubview:_label];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(100, 200, 100, 44);
    [_button setTitle:@"click me" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _button.backgroundColor = [UIColor yellowColor];
    [_button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_button];
}

- (void)refreshViewWithModel:(MVCModel *)model {
    _label.text = _model.text;
}

#pragma mark - ================ Actions =================

- (void)buttonClicked {
    if (_buttonClickBlock) {
        _buttonClickBlock();
    }
}

#pragma mark - ================ Getter and Setter =================

- (void)setModel:(MVCModel *)model {
    _model = model;
    [self refreshViewWithModel:model];
}

@end
