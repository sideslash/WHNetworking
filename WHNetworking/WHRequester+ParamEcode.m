//
//  WHRequester+ParamEcode.m
//  WHCenter
//
//  Created by xhkj on 2020/3/28.
//  Copyright © 2020 xhkj. All rights reserved.
//

#import "WHRequester+ParamEcode.h"
#import <NSObject+YYModel.h>

@implementation WHRequester (ParamEcode)

+ (NSString *)encodeParam:(NSDictionary *)param type:(WHRequestContentType)type
{
  if (type == WHRequestContentTypeXXXForm) {
    NSMutableString *paramFormString = [NSMutableString string];
    [param enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
      if (paramFormString.length) {
        [paramFormString appendString:@"&"];
      }
      [paramFormString appendString:[NSString stringWithFormat:@"%@", key]];
      [paramFormString appendString:@"="];
      [paramFormString appendString:[NSString stringWithFormat:@"%@", obj]];
    }];
    
    return paramFormString;
  }else if (type == WHRequestContentTypeJson) {
    NSString *jsonStr = [param yy_modelToJSONString];
    return jsonStr;
  }
  
  return nil;
}

@end
