#import "PayuMoneyFlutterPlugin.h"
#if __has_include(<payu/payu-Swift.h>)
#import <payu/payu-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "payu-Swift.h"
#endif

@implementation PayuMoneyFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPayuMoneyFlutterPlugin registerWithRegistrar:registrar];
}
@end
