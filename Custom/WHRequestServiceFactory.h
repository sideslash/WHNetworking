//
//  WHRequestServiceFactory.h
//  LTCustom
//
//  Created by xhkj on 2020/4/3.
//  Copyright © 2020 xhkj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHRequestService.h"

NS_ASSUME_NONNULL_BEGIN
//
//extern NSString * const kWHServiceSmartHomeYunLian;
//extern NSString * const kWHServiceSmartHomeLumi;

@interface WHRequestServiceFactory : NSObject

+ (instancetype)sharedInstance;
- (WHRequestService<WHRequestServiceProtocol> *)serviceWithIdentifier:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
