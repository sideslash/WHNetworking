//
//  WHRequestService.m
//  LTCustom
//
//  Created by xhkj on 2020/4/3.
//  Copyright © 2020 xhkj. All rights reserved.
//

#import "WHRequestService.h"

@implementation WHRequestService

- (id)checkAndGetDatasFromResponse:(NSDictionary *)resp error:(NSString *_Nullable*_Nullable)errMsg
{
  if (errMsg) {
    *errMsg = @"该协议应由子类完成";
  }
  return nil;
}

- (NSString *)host
{
  return nil;
}

@end
