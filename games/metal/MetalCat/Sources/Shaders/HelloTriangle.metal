#include <metal_stdlib>

using namespace metal;

struct VertexIn {
    float3 position [[ attribute(0) ]];
    float4 color    [[ attribute(1) ]];
};

struct RasterizerData {
    float4 position [[ position ]];
    float4 color;
};

vertex RasterizerData basic_vertex_main(const VertexIn vertexIn [[ stage_in ]]) {
    RasterizerData rd;

    rd.position = float4(vertexIn.position, 1.0f);
    rd.color = vertexIn.color;

    return rd;
}

fragment float4 basic_fragment_main(RasterizerData rd [[ stage_in ]]) {
    float4 c = rd.color;

    return float4(c.r, c.g, c.b, c.a);
}
