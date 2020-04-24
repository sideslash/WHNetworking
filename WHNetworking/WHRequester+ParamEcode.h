//
//  WHRequester+ParamEcode.h
//  SHCenter
//
//  Created by xhkj on 2020/3/28.
//  Copyright © 2020 xhkj. All rights reserved.


#import "WHRequester.h"
#import "WHRequestEnums.h"

NS_ASSUME_NONNULL_BEGIN

@interface WHRequester (ParamEcode)

+ (NSString *)encodeParam:(NSDictionary *)param type:(WHRequestContentType)type;
@end

NS_ASSUME_NONNULL_END
