shader_type spatial;

uniform float range : hint_range(0.0, 0.1, 0.005)= 0.05;
uniform float noiseQuality : hint_range(0.0, 300.0, 0.1)= 250.0;
uniform float noiseIntensity : hint_range(-0.6, 0.6, 0.0010)= 0.0088;
uniform float offsetIntensity : hint_range(-0.1, 0.1, 0.001) = 0.03;
uniform float colorOffsetIntensity : hint_range(0.0, 5.0, 0.001) = 1.3;
uniform float redVal : hint_range(0, 1) = 0.0;
uniform sampler2D screen_texture : hint_screen_texture;
render_mode unshaded;
float rand(vec2 co)
{
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

float verticalBar(float pos, float UVY, float offset)
{
    float edge0 = (pos - range);
    float edge1 = (pos + range);

    float x = smoothstep(edge0, pos, UVY) * offset;
    x -= smoothstep(pos, edge1, UVY) * offset;
    return x;
}
const float saturation = 0.2;
void fragment()
{
    vec2 uv = SCREEN_UV;
    for (float i = 0.0; i < 0.71; i += 0.1313)
    {
        float d = mod(TIME * i, 1.7);
        float o = sin(1.0 - tan(TIME * 0.24 * i));
    	o *= offsetIntensity;
        uv.x += verticalBar(d, UV.y, o);
    }
    
    float UVY = uv.y;
    UVY *= noiseQuality;
    UVY = float(int(UVY)) * (1.0 / noiseQuality);
    float noise = rand(vec2(TIME * 0.00001, UVY));
    uv.x += noise * noiseIntensity;

    vec2 offsetR = vec2(0.009 * sin(TIME), 0.0) * colorOffsetIntensity;
    vec2 offsetG = vec2(0.0073 * (cos(TIME * 0.97)), 0.0) * colorOffsetIntensity;
    
    float r = texture(screen_texture, uv + offsetR).r;
    float g = texture(screen_texture, uv + offsetG).g;
    float b = texture(screen_texture, uv).b;
    vec4 tex = vec4(r, g*(1.0-redVal), b*(1.0-redVal), 1.0);
    ALBEDO = tex.rgb;
}