//
//  WHRequestBaseAPI.m
//  LTCustom
//
//  Created by xhkj on 2020/4/3.
//  Copyright © 2020 xhkj. All rights reserved.
//

#import "WHRequestBaseAPI.h"
#import "WHRequester.h"
#import "WHRequestServiceFactory.h"

@implementation WHRequestBaseAPI
- (void)startRequest:(WHRequestAPISuccess)success failure:(WHRequestAPIFailure)failure
{
  _loading = YES;
  
  NSString *paramErrMsg = nil;
  BOOL valid = [self paramsAreValid:&paramErrMsg];
  if (!valid) {
    _loading = NO;
    failure(paramErrMsg);
    return;
  }
  
  WHRequestService *service = [[WHRequestServiceFactory sharedInstance] serviceWithIdentifier:[self serviceIdentifier]];
  if (!service) {
    _loading = NO;
    failure(@"缺少响应处理service");
    return;
  }
  
  NSString *requestAddress = [NSString stringWithFormat:@"%@%@", [service host], [self requestRelativeAddress]];
  
  [WHRequester requestToUrlString:requestAddress params:[self paramsDic] method:[self requestMethod] contentType:[self requestContentType] handler:^(NSDictionary * _Nonnull respData, NSError * _Nonnull error) {
    if (error) {
      _loading = NO;
      failure(error.localizedDescription);
      return ;
    }
    
    NSString *respCheckErrMsg = nil;
    id realData = [service checkAndGetDatasFromResponse:respData error:&respCheckErrMsg];
    if (respCheckErrMsg) {
      _loading = NO;
      failure(respCheckErrMsg);
      return;
    }
    
    _loading = NO;
    success(realData);
  }];
}

#pragma mark - WHRequestAPIInfoProtocol
- (NSString *)serviceIdentifier
{
  return @"";
}
- (WHRequestMethod)requestMethod
{
  return WHRequestMethodPost;
}
- (NSString *)requestRelativeAddress
{
  return nil;
}
- (WHRequestContentType)requestContentType
{
  return WHRequestContentTypeJson;
}

#pragma mark - WHRequestParamProvider
- (BOOL)paramsAreValid:(NSString *_Nullable*_Nullable)errMsg
{
  if (errMsg) {
    *errMsg = @"请由子类实现此协议";
  }
  return NO;
}

- (NSDictionary *)paramsDic
{
  return @{};
}

@end
