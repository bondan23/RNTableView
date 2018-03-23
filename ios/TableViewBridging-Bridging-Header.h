//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

// import RCTBridgeModule
#if __has_include(<React/RCTBridgeModule.h>)
#import <React/RCTBridgeModule.h>
#elif __has_include(“RCTBridgeModule.h”)
#import “RCTBridgeModule.h”
#else
#import “React/RCTBridgeModule.h” // Required when used as a Pod in a Swift project
#endif

// import RCTEventEmitter
#if __has_include(<React/RCTViewManager.h>)
#import <React/RCTViewManager.h>
#elif __has_include(“RCTViewManager.h”)
#import “RCTViewManager.h”
#else
#import “React/RCTViewManager.h” // Required when used as a Pod in a Swift project
#endif

// import RCTComponent
#if __has_include(<React/RCTComponent.h>)
#import <React/RCTComponent.h>
#elif __has_include(“RCTComponent.h”)
#import “RCTComponent.h”
#else
#import “React/RCTComponent.h” // Required when used as a Pod in a Swift project
#endif
