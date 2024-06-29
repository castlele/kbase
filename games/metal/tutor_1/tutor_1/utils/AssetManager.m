#import "AssetManager.h"

@implementation AssetManager

- (instancetype) init
{
    self = [super init];

    if (self) {
        _exportDirectory = @"Downloads";
    }

    return self;
}

- (BOOL) exportAsset:(MDLObject *)obj fileName:(NSString *)fn fileExtensionType:(ModelFileExtensionType)fileExt {
    NSString *ext = [@"." stringByAppendingString:[self getFileExtensionOfType:fileExt]];
    MDLAsset *asset = [[MDLAsset alloc] init];

    [asset addObject:obj];

    NSURL *resourcesFolder = [[NSURL alloc] initWithString:@"Downloads"];
    NSURL *fileURL = [resourcesFolder URLByAppendingPathComponent:[fn stringByAppendingString:ext]];

    NSError *err;
    [asset exportAssetToURL:fileURL error:&err];

    if (err) {
        NSLog(@"faild with error: %@", err);
        return FALSE;
    }

    return TRUE;
}

- (NSString *) getFileExtensionOfType:(ModelFileExtensionType)fileExt
{
    switch (fileExt) {
    case OBJ_TYPE:
        return @"obj";
    }
}

@end
