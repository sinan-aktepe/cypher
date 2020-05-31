#import "CypherPlugin.h"
#if __has_include(<cypher/cypher-Swift.h>)
#import <cypher/cypher-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "cypher-Swift.h"
#endif

@implementation CypherPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCypherPlugin registerWithRegistrar:registrar];
}
@end
