//
//  JSDBannerObjManager.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/9/16.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDBannerObjManager.h"

@interface JSDBannerObjManagerSubscriber : NSObject
@property (strong, nonatomic) NSMutableDictionary<NSString *, ObserverHandler> *handlers;
@end
@implementation JSDBannerObjManagerSubscriber
@end

@interface JSDBannerObjManager()

@property (strong, nonatomic) NSMutableDictionary<NSNumber *, JSDBannerObjManagerSubscriber *> *subscribers;

@end

@implementation JSDBannerObjManager

- (void)addObj:(NSObject *)obj keyPath:(NSString *)keyPath block:(ObserverHandler)handler {
    [obj addObserver:self forKeyPath:keyPath options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
    NSNumber *key = @(obj.hash);
    JSDBannerObjManagerSubscriber *sub = [self fetchSubscriber:key];
    [sub.handlers setValue:handler forKey:keyPath];
    
    [self.subscribers setObject:sub forKey:@(obj.hash)];
}

- (void)rmObj:(NSObject *)obj keyPath:(NSString *)keyPath {
    NSNumber *key = @(obj.hash);
    if (![self.subscribers.allKeys containsObject:key]) return;
    JSDBannerObjManagerSubscriber *sub = self.subscribers[key];
    
    if (![sub.handlers.allKeys containsObject:keyPath]) return;
    [sub.handlers removeObjectForKey:keyPath];
    [obj removeObserver:self forKeyPath:keyPath];
}

- (void)rmObj:(NSObject *)obj {
    NSNumber *key = @(obj.hash);
    if (![self.subscribers.allKeys containsObject:key]) return;
    JSDBannerObjManagerSubscriber *sub = self.subscribers[key];
    
    for (NSString *keyPath in sub.handlers) {
        [obj removeObserver:self forKeyPath:keyPath];
        [sub.handlers removeObjectForKey:keyPath];
    }
}

- (void)rmAllObj {
    for (NSNumber *hashKey in self.subscribers.allKeys) {
        [self rmObj:self.subscribers[hashKey]];
    }
}

#pragma mark -

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSObject *obj = (NSObject *)object;
    NSNumber *key = @(obj.hash);
    if (![self.subscribers.allKeys containsObject:key]) return;
    JSDBannerObjManagerSubscriber *sub = self.subscribers[key];
    
    if (![sub.handlers.allKeys containsObject:keyPath]) return;
    ObserverHandler handler = sub.handlers[keyPath];
    handler(change);
}

#pragma mark -

- (JSDBannerObjManagerSubscriber *)fetchSubscriber:(NSNumber *)key {
    JSDBannerObjManagerSubscriber *sub;
    if ([self.subscribers.allKeys containsObject:key]) {
        sub = self.subscribers[key];
    } else {
        sub = [JSDBannerObjManagerSubscriber new];
        sub.handlers = [NSMutableDictionary new];
    }
    return sub;
}

+ (instancetype)mgr {
    static JSDBannerObjManager *_ton = nil;
    static dispatch_once_t wd_ObserverMgr;
    dispatch_once(&wd_ObserverMgr, ^{
        _ton = [[self alloc] init];
    });
    return _ton;
}

- (NSMutableDictionary *)subscribers {
    if (!_subscribers) {
        _subscribers = [NSMutableDictionary dictionary];
    }
    return _subscribers;
}

@end
