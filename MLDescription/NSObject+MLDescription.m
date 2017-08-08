//
//  NSObject+MLDescription.m
//  TestWei
//
//  Created by MaLi on 2017/7/27.
//  Copyright © 2017年 mali. All rights reserved.
//

#import "NSObject+MLDescription.h"
#import <objc/runtime.h>

@implementation NSObject (MLDescription)

- (NSString *)description {
    u_int count;
    objc_property_t *properties  =class_copyPropertyList([self class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    NSMutableArray *propertiesValueArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i<count; i++) {
        const char* propertyName =property_getName(properties[i]);
        if (strcmp(propertyName,"description") == 0 || strcmp(propertyName,"superclass") == 0 || strcmp(propertyName,"debugDescription") == 0) {
            continue;
        }
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
        id propertyValue = [self valueForKey:[NSString stringWithUTF8String:propertyName]];
        if (propertyValue == nil) {
            [propertiesValueArray addObject:@""];
        } else {
            [propertiesValueArray addObject:propertyValue];
        }
    }
    free(properties);
    NSString *formatString = @"<%@: %p";
    NSString *rightFormatString = @"----%@=%@";
    NSString *returnString = [NSString stringWithFormat:formatString, [self class], self];
    for (NSInteger i = 0; i < propertiesValueArray.count; i++) {
        returnString = [returnString stringByAppendingString:[NSString stringWithFormat:rightFormatString, propertiesArray[i], propertiesValueArray[i]]];
    }
    returnString = [returnString stringByAppendingString:@">"];
    return returnString;
}

@end
