//
//  WHRequestServiceFactory.m
//  LTCustom
//
//  Created by xhkj on 2020/4/3.
//  Copyright © 2020 xhkj. All rights reserved.
//

#import "WHRequestServiceFactory.h"
//#import "SHSmartHomeYunlianService.h"
//#import "SHSmartHomeLumiService.h"

// service name list
//NSString * const kWHServiceSmartHomeYunLian = @"kWHServiceSmartHomeYunLian";
//NSString * const kWHServiceSmartHomeLumi = @"kWHServiceSmartHomeLumi";

@interface WHRequestServiceFactory()
@property (nonatomic, strong) NSMutableDictionary *serviceStorage;
@end

@implementation WHRequestServiceFactory

#pragma mark - getters and setters
- (NSMutableDictionary *)serviceStorage
{
    if (_serviceStorage == nil) {
        _serviceStorage = [[NSMutableDictionary alloc] init];
    }
    return _serviceStorage;
}

#pragma mark - life cycle
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static WHRequestServiceFactory *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[WHRequestServiceFactory alloc] init];
    });
    return sharedInstance;
}

#pragma mark - public methods
- (WHRequestService<WHRequestServiceProtocol> *)serviceWithIdentifier:(NSString *)identifier
{
    if (self.serviceStorage[identifier] == nil) {
        self.serviceStorage[identifier] = [self newServiceWithIdentifier:identifier];
    }
    return self.serviceStorage[identifier];
}

#pragma mark - private methods
- (WHRequestService<WHRequestServiceProtocol> *)newServiceWithIdentifier:(NSString *)identifier
{
//    if ([identifier isEqualToString:kWHServiceSmartHomeYunLian]) {
//        return [[SHSmartHomeYunlianService alloc] init];
//    }
//    
//    if ([identifier isEqualToString:kWHServiceSmartHomeLumi]) {
//        return [[SHSmartHomeLumiService alloc] init];
//    }
    
    return nil;
}


@end
