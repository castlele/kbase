#import "Mesh.h"

@implementation Quad

@synthesize vertices, buffer;

- (instancetype) initWithDevice:(id<MTLDevice>)d scale:(float)s
{
    self = [super init];

    if (self) {
        NSArray *vertices = @[
            @-1,  @1, @0,
            @1, @-1, @0,
            @-1, @-1, @0,
            @-1,  @1, @0,
            @1,  @1, @0,
            @1, @-1, @0,
        ];

        NSArray *scaledVertices = map(vertices, ^id(id point) {
            float p = (NSInteger)point * s;
            NSNumber *scaledPoint = [[NSNumber alloc] initWithFloat:p];

            return scaledPoint;
        });

        id<MTLBuffer> buffer = [d newBufferWithBytes:&vertices
                                              length:sizeof(float)*vertices.count
                                             options:MTLResourceStorageModeShared];

        self.vertices = vertices;
        self.buffer = buffer;
    }
    return self;
}

@end
