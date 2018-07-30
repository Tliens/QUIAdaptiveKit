//
//  NSLayoutConstraint+XHLayoutConstraint.m
//  QUIAdaptiveKit
//
//  Created by Quinn_F on 2018/7/30.
//  Copyright © 2018年 quinn. All rights reserved.
//

#import "NSLayoutConstraint+XHLayoutConstraint.h"
#import <objc/runtime.h>
#import "Constrants.h"

@implementation NSLayoutConstraint (XHLayoutConstraint)

- (void)setAdaptive:(BOOL)widthAdaptive {
    if (widthAdaptive) {
        CGFloat _cons = self.constant;
        _cons = _cons * XH_SCREEN_SCALE;
        self.constant = _cons;
    }
    objc_setAssociatedObject(self, @selector(adaptive), @(widthAdaptive), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (BOOL)adaptive {
    NSNumber *value = objc_getAssociatedObject(self, @selector(adaptive));
    return [value boolValue];
}
@end
