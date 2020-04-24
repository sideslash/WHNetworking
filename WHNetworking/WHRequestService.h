//
//  WHRequestService.h
//  LTCustom
//
//  Created by xhkj on 2020/4/3.
//  Copyright © 2020 xhkj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WHRequestServiceProtocol <NSObject>
//检查请求的返回，不同的服务器有不同的错误标准检测，成功则返回真实数据结构
- (id)checkAndGetDatasFromResponse:(NSDictionary *)resp error:(NSString *_Nullable*_Nullable)errMsg;
//请求地址
- (NSString *)host;
@end

@interface WHRequestService : NSObject<WHRequestServiceProtocol>

@end

NS_ASSUME_NONNULL_END
