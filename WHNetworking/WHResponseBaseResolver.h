//
//  WHResponseBaseResolver.h
//  LTCustom
//
//  Created by xhkj on 2020/4/3.
//  Copyright © 2020 xhkj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WHRespResolverProtocol <NSObject>
- (id _Nullable)resolveData:(id _Nullable)data errorMsg:(NSString *_Nullable*_Nullable)errorMsg;
@end

@interface WHResponseBaseResolver : NSObject<WHRespResolverProtocol>

@end

NS_ASSUME_NONNULL_END
