//
//  main.m
//  Copy-Strong-Array-MutableArray
//
//  Created by mjpc on 2017/3/15.
//  Copyright © 2017年 mali. All rights reserved.
//




#import <Foundation/Foundation.h>

@interface Test : NSObject

@property (nonatomic, strong) NSArray *arrayOfStrong;
@property (nonatomic, copy) NSArray *arrayOfCopy;
@property (nonatomic, strong) NSMutableArray *mutableArrayOfStrong;
@property (nonatomic, copy) NSMutableArray *mutableArrayOfCopy;


@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Test *object = [Test new];
        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@"A"]];
        object.arrayOfStrong = array;
        object.arrayOfCopy = array;
        [array addObject:@"B"];
        NSLog(@"arrayOfStrong:%@ %p",object.arrayOfStrong, object.arrayOfStrong);
        NSLog(@"arrayOfCopy:%@",object.arrayOfCopy);
    }
    return 0;
}
