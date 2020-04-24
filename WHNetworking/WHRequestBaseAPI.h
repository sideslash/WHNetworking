//
//  WHRequestBaseAPI.h
//  LTCustom
//
//  Created by xhkj on 2020/4/3.
//  Copyright © 2020 xhkj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHRequestEnums.h"
#import "WHRequestServiceFactory.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^WHRequestAPISuccess)(id _Nullable realData);
typedef void (^WHRequestAPIFailure)(NSString * _Nullable errMsg);


@protocol WHRequestAPIInfoProtocol <NSObject>
- (NSString *)serviceIdentifier;
- (NSString *)requestRelativeAddress;
- (WHRequestMethod)requestMethod;//default is SHRequestMethodPost
- (WHRequestContentType)requestContentType;//default is SHRequestContentTypeJson
@end


@protocol WHRequestParamProvider <NSObject>
- (NSDictionary *)paramsDic;
- (BOOL)paramsAreValid:(NSString *_Nullable*_Nullable)errMsg;
@end

@interface WHRequestBaseAPI : NSObject<WHRequestAPIInfoProtocol, WHRequestParamProvider>

- (void)startRequest:(WHRequestAPISuccess)success failure:(WHRequestAPIFailure)failure;
@property (nonatomic, assign, readonly) BOOL loading;

@end

NS_ASSUME_NONNULL_END
