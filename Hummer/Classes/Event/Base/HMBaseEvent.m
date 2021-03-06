//
//  HMBaseEvent.m
//  Hummer
//
//  Copyright © 2019年 huangjy. All rights reserved.
//

#import "HMBaseEvent.h"
#import "HMExportManager.h"
#import "JSValue+Hummer.h"
#import "UIView+HMEvent.h"
#import "NSObject+Hummer.h"

NSString * const HMLongPressEventName   = @"longPress";
NSString * const HMTapEventName         = @"tap";
NSString * const HMSwipeEventName       = @"swipe";
NSString * const HMPinchEventName       = @"pinch";
NSString * const HMPanEventName         = @"pan";
NSString * const HMScrollEventName      = @"scroll";
NSString * const HMInputEventName       = @"input";
NSString * const HMSwitchEventName      = @"switch";

@implementation HMBaseEvent

HM_EXPORT_CLASS(Event, HMBaseEvent);

HM_EXPORT_PROPERTY(type, __type, __setType:)
HM_EXPORT_PROPERTY(target, __target, __setTarget:)
HM_EXPORT_PROPERTY(timestamp, __timestamp, __setTimestamp:)

- (instancetype)initWithValues:(NSArray *)values {
    self = [super initWithValues:values];
    if(self){
        _timestamp = [[NSDate date] timeIntervalSince1970];
    }
    return self;
}

- (void)updateEvent:(UIView *)view withContext:(id)context {
    self.target = view;
}

#pragma mark - Export Method

- (JSValue *)__type {
    return [JSValue valueWithObject:self.type inContext:self.jsContext];
}

- (void)__setType:(__unused JSValue *)type {
    NSAssert(NO, @"cannot set read only property");
}

- (JSValue *)__target {
    return ((NSObject *)self.target).jsValue;
}

- (void)__setTarget:(__unused JSValue *)target {
    NSAssert(NO, @"cannot set read only property");
}

- (JSValue *)__timestamp {
    return [JSValue valueWithDouble:self.timestamp inContext:self.jsContext];
}

- (void)__setTimestamp:(__unused JSValue *)timestamp {
    NSAssert(NO, @"cannot set read only property");
}

@end
