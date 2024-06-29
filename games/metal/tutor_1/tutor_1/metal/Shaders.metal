#include <metal_stdlib>

using namespace metal;

struct VertexIn {
    float4 position [[attribute(0)]];
};

vertex float4 vertex_main(constant float3 *vertices [[buffer(0)]],
                          uint vertexID [[vertex_id]]) {
    float4 position = float4(vertices[vertexID], 1);
//    position.y -= 1.0;

    return position;
}

fragment float4 fragment_main() {
    return float4(1, 0, 0, 1);
}
