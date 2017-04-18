//
//  MVCView.h
//  MVC-MVP-MVVM-VIPER
//
//  Created by mali on 2017/3/22.
//  Copyright © 2017年 mali. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MVCView : UIView

@property (nonatomic, copy) void (^buttonClickBlock)();
@property (nonatomic, copy) NSString *viewText;

@end
