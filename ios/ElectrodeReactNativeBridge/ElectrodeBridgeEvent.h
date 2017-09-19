//
//  ElectrodeBridgeEvent.h
//  ElectrodeReactNativeBridge
//
//  Created by Claire Weijie Li on 3/21/17.
//  Copyright © 2017 Walmart. All rights reserved.
//

#import "ElectrodeBridgeMessage.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface ElectrodeBridgeEvent : ElectrodeBridgeMessage

+ (nullable instancetype)createEventWithData:(NSDictionary *)data;
- (instancetype)initWithName:(NSString *)name data:(id)data;
@end

NS_ASSUME_NONNULL_END
