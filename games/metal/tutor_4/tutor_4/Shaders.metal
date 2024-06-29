#include <metal_stdlib>
using namespace metal;

vertex float4 vertex_main(constant float3 *vertices [[buffer(0)]],
                          uint i [[vertex_id]]) {
    float4 pos = float4(vertices[i], 1);
    return pos;
}

fragment float4 fragment_main() {
    return float4(0, 1, 0, 1);
}
