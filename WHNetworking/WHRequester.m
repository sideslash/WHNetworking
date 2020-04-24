//
//  WHRequester.m
//  SHCenter
//
//  Created by xhkj on 2020/3/27.
//  Copyright © 2020 xhkj. All rights reserved.
//

#import "WHRequester.h"
#import "WHRequester+ParamEcode.h"

@implementation WHRequester

+ (void)requestToUrlString:(NSString *)urlString params:(NSDictionary *)params method:(WHRequestMethod)method contentType:(WHRequestContentType)contentType handler:(void (^)(NSDictionary *respData, NSError *error))handler
{
  if (method == WHRequestMethodPost) {
    [self postToUrlString:urlString params:params contentType:contentType handler:handler];
  }else if (method == WHRequestMethodGet) {
    [self getToUrlString:urlString params:params handler:handler];
  }
}

+ (void)postToUrlString:(NSString *)urlString params:(NSDictionary *)params contentType:(WHRequestContentType)contentType handler:(void (^)(NSDictionary *respData, NSError *error))handler
{
  NSLog(@"\n****************************************************  requet start  ************************************************************\nurl:%@\nparam:%@\n****************************************************************************************************************************", urlString, params);
  
  NSURL *url = [NSURL URLWithString:urlString];
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

  NSString *paramFormString = [self encodeParam:params type:contentType];
  request.HTTPBody = [paramFormString dataUsingEncoding:NSUTF8StringEncoding];
  request.HTTPMethod = @"POST";
  
  if (contentType == WHRequestContentTypeXXXForm) {
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
  }else if (contentType == WHRequestContentTypeJson) {
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  }
  
  NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
    if (error && handler) {
      dispatch_async(dispatch_get_main_queue(), ^{
        handler(nil, error);
      });
      return ;
    }
    
    NSError *serializationError = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&serializationError];
    if (serializationError) {
      NSLog(@"serialization error:%@", serializationError);
      dispatch_async(dispatch_get_main_queue(), ^{
        handler(nil, serializationError);
      });
      return ;
    }
    
    NSLog(@"resp:%@", dict);
    
    dispatch_async(dispatch_get_main_queue(), ^{
      handler(dict, nil);
    });
  }];
  [task resume];
}

+ (void)getToUrlString:(NSString *)urlString params:(NSDictionary *)params handler:(void (^)(NSDictionary *, NSError *))handler
{
  NSMutableString *trueUrlString = [NSMutableString stringWithFormat:@"%@?", urlString];
  [params enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
    if (![[trueUrlString substringFromIndex:trueUrlString.length-1] isEqualToString:@"?"]) {
      [trueUrlString appendString:@"&"];
    }
    [trueUrlString appendString:[NSString stringWithFormat:@"%@", key]];
    [trueUrlString appendString:@"="];
    [trueUrlString appendString:[NSString stringWithFormat:@"%@", obj]];
  }];
  
  NSLog(@"url:%@", trueUrlString);
  NSURL *url = [NSURL URLWithString:trueUrlString];
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
  
  NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error) {
      dispatch_async(dispatch_get_main_queue(), ^{
        handler(nil, error);
      });
      return ;
    }
    NSError *serializationError = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&serializationError];
    if (serializationError) {
      NSLog(@"serialization error:%@", serializationError);
      dispatch_async(dispatch_get_main_queue(), ^{
        handler(nil, serializationError);
      });
      return ;
    }
    
    NSLog(@"resp obj:%@", dict);
    dispatch_async(dispatch_get_main_queue(), ^{
      handler(dict, nil);
    });
  }];
  [task resume];
  
}

+ (NSError *)errorWithDesc:(NSString *)desc code:(NSInteger)code
{
  
  NSString *reason = desc ? desc : @"失败";
  NSDictionary *info = @{NSLocalizedDescriptionKey : reason,
                         NSLocalizedFailureReasonErrorKey : reason
                         };
  return [NSError errorWithDomain:@"com.error.requester"
                             code:code
                         userInfo:info];
}


+ (NSError *)errorWithDesc:(NSString *)desc
{
  return [self errorWithDesc:desc code:0];
}

@end
