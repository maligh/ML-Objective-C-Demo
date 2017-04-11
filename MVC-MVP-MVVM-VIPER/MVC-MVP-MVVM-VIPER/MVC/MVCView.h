//
//  MVCView.h
//  MVC-MVP-MVVM-VIPER
//
//  Created by mali on 2017/3/22.
//  Copyright © 2017年 mali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVCModel.h"

@interface MVCView : UIView

+ (instancetype)initwithModel:(MVCModel *)model;
- (void)refreshViewWithModel:(MVCModel *)model;

@property (nonatomic, strong) MVCModel *model;
@property (nonatomic, copy) void (^buttonClickBlock)();

@end
