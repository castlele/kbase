#import "Foundation/Foundation.h"
#import "MetalKit/MetalKit.h"
#import "Utils.h"

@interface Quad : NSObject

@property NSArray *vertices;
@property id<MTLBuffer> buffer;

- (instancetype) initWithDevice:(id<MTLDevice>)d scale:(float)s;

@end

