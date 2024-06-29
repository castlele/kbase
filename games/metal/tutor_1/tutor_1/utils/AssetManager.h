#import <MetalKit/MetalKit.h>
#import <Foundation/Foundation.h>

typedef enum {
    OBJ_TYPE,
} ModelFileExtensionType;

@interface AssetManager : NSObject

@property(strong) NSString * exportDirectory;

- (instancetype) init;

- (BOOL) exportAsset:(MDLObject *)obj fileName:(NSString *)fn fileExtensionType:(ModelFileExtensionType)fileExt;
- (NSString *) getFileExtensionOfType:(ModelFileExtensionType)fileExt;

@end
