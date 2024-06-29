#import <MetalKit/MetalKit.h>

#import "ViewController.h"
#import "TrainView.h"
#import "PrimitivesCreator.h"
#import "PipelineStateUtils.h"
#import "Common.h"

enum MeshType {
    CUBE,
    TRAIN,
    CUSTOM,
};

@implementation ViewController

{
    enum MeshType meshType;
}

@synthesize metalView, changeMeshButton;
@synthesize renderer, assetManager;

// MARK: - Init

- (instancetype) initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];

    if (self) {
        meshType = CUSTOM;
        assetManager = [[AssetManager alloc] init];
        metalView = [[MetalView alloc] initWithFrame:NSMakeRect(0, 0, 1024, 768)];
        changeMeshButton = [[NSButton alloc] init];
        renderer = [[Renderer alloc] initWithMetalView:metalView];

        [self updateMesh];
    }

    return self;
}

// MARK: - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addViews];
    [self configureLayout];
    [self bindViews];
    [self configureAppearance];
}

// MARK: - InitializableViewController

- (void) addViews
{
    [self.view addSubview:metalView];
    [self.view addSubview:changeMeshButton];
}

- (void) configureLayout
{
    for (NSView *view in @[metalView, changeMeshButton]) {
        view.translatesAutoresizingMaskIntoConstraints = FALSE;
    }

    [NSLayoutConstraint activateConstraints:@[
        [metalView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [metalView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [metalView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [metalView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],

        [changeMeshButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [changeMeshButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [changeMeshButton.heightAnchor constraintEqualToConstant:50],
    ]];
}

- (void) bindViews
{
    [changeMeshButton setTarget:self];
    [changeMeshButton setAction:@selector(configureMesh)];
}

- (void) configureAppearance
{
    [changeMeshButton setTitle:@"Change mesh"];
    changeMeshButton.layer.backgroundColor = NSColor.redColor.CGColor;
}

// MARK: - Public methods

- (void) updateMesh
{
    [self configureMesh];
    [self configurePipelineState];
}

// MARK: - Private methods

- (void) configureMesh
{
    if (meshType == CUSTOM) {
        [renderer showQuadMesh];
        return;
    }

    __weak ViewController *weakSelf = self;

    [renderer setMeshWithBlock:^MTKMesh *(id<MTLDevice> device, NSError *err) {
        ViewController *strongSelf = weakSelf;

        switch (strongSelf->meshType) {
        case CUBE:
            strongSelf->meshType = TRAIN;
            return createCube(device, err);

        case TRAIN:
            strongSelf->meshType = CUBE;
            return createTrain(device, err);

        default:
            strongSelf->meshType = CUBE;
            return createTrain(device, err);
        }
    }];
}

- (void) configurePipelineState
{
    [renderer setPipelineStateWithBlock:^id<MTLRenderPipelineState>(id<MTLLibrary> lib, MTLPixelFormat pf,
                                                                    MTLVertexDescriptor *vd, NSError *err) {
        return createPipeLineState(lib, pf, vd, MAIN_VERTEX, MAIN_FRAGMENT, err);
    }];
}

@end
