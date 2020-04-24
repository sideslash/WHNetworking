//
//  WHRequester.h
//  SHCenter
//
//  Created by xhkj on 2020/3/27.
//  Copyright © 2020 xhkj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHRequestEnums.h"

NS_ASSUME_NONNULL_BEGIN

@interface WHRequester : NSObject

+ (void)requestToUrlString:(NSString *)urlString params:(NSDictionary *)params method:(WHRequestMethod)method contentType:(WHRequestContentType)contentType handler:(void (^)(NSDictionary *respData, NSError *error))handler;

//+ (void)getToUrlString:(NSString *)urlString params:(NSDictionary *)params handler:(void (^)(NSDictionary *respData, NSError *error))handler;
//
//+ (void)postToUrlString:(NSString *)urlString params:(NSDictionary *)params contentType:(SHRequestContentType)contentType handler:(void (^)(NSDictionary *respData, NSError *error))handler;
@end

NS_ASSUME_NONNULL_END
