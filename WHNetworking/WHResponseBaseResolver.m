//
//  WHResponseBaseResolver.m
//  LTCustom
//
//  Created by xhkj on 2020/4/3.
//  Copyright © 2020 xhkj. All rights reserved.
//

#import "WHResponseBaseResolver.h"

@implementation WHResponseBaseResolver
- (id)resolveData:(id)data errorMsg:(NSString * _Nullable __autoreleasing *)errorMsg
{
  if (errorMsg) {
    *errorMsg = @"改协议方法应由子类完成";
  }
  return nil;
}
@end
