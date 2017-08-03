//
//  People.m
//  MessageForwarding
//
//  Created by mjpc on 2017/7/29.
//  Copyright © 2017年 mali. All rights reserved.
//

#import "People.h"
#import <objc/runtime.h>
#import "Bird.h"
#import "Monkey.h"

void speak(id self, SEL _cmd){
    NSLog(@"Now I can speak.");
}

@implementation People

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    NSLog(@"resolveInstanceMethod:  %@", NSStringFromSelector(sel));
    if (sel == @selector(speak)) {
        class_addMethod([self class], sel, (IMP)speak, "V@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardingTargetForSelector:  %@", NSStringFromSelector(aSelector));
    Bird *bird = [[Bird alloc] init];
    if ([bird respondsToSelector: aSelector]) {
        return bird;
    }
    return [super forwardingTargetForSelector: aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation: %@", NSStringFromSelector([anInvocation selector]));
    if ([anInvocation selector] == @selector(code)) {
        Monkey *monkey = [[Monkey alloc] init];
        [anInvocation invokeWithTarget:monkey];
    }   
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"method signature for selector: %@", NSStringFromSelector(aSelector));
    if (aSelector == @selector(code)) {
        return [NSMethodSignature signatureWithObjCTypes:"V@:@"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"doesNotRecognizeSelector: %@", NSStringFromSelector(aSelector));
    [super doesNotRecognizeSelector:aSelector];
}

@end
