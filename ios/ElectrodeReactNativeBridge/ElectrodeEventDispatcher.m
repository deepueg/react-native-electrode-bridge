//
//  ElectrodeEventDispatcher.m
//  ElectrodeReactNativeBridge
//
//  Created by Claire Weijie Li on 3/24/17.
//  Copyright © 2017 Walmart. All rights reserved.
//

#import "ElectrodeEventDispatcher.h"
#import "ElectrodeBridgeProtocols.h"
#import "ElectrodeLogger.h"

@interface ElectrodeEventRegistrar ()

@property(nonatomic, strong) ElectrodeEventRegistrar *eventRegistrar;

@end

@implementation ElectrodeEventDispatcher

- (instancetype)initWithEventRegistrar:
    (ElectrodeEventRegistrar *)eventRegistrar {
  if (self = [super init]) {
    _eventRegistrar = eventRegistrar;
  }

  return self;
}

- (void)dispatchEvent:(ElectrodeBridgeEvent *)bridgeEvent {
  NSArray<ElectrodeBridgeEventListener> *eventListeners =
      [self.eventRegistrar getEventListnersForName:bridgeEvent.name];

  for (ElectrodeBridgeEventListener eventListener in eventListeners) {
    ERNDebug(@"ElectrodeEventDispatcher is dispatching events %@, id(%@) to "
             @"listener %@",
             bridgeEvent.name, bridgeEvent.messageId, eventListener);
    dispatch_async(dispatch_get_main_queue(), ^{
      if (eventListener) {
        eventListener(bridgeEvent.data);
      }
    });
  }
}

@end
