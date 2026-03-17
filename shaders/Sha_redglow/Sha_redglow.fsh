varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_TexelX;
uniform float u_TexelY;
uniform float u_GlowSize;
uniform float u_Intensity;
uniform float u_ColorR;
uniform float u_ColorG;
uniform float u_ColorB;

void main() {
    vec2 blurOffset = vec2(u_TexelX * u_GlowSize, u_TexelY * u_GlowSize);
    
    float mask = 0.0;
    
    // Center
    mask += texture2D(gm_BaseTexture, v_vTexcoord).a * 0.25;
    
    // Orthogonal neighbors
    mask += texture2D(gm_BaseTexture, v_vTexcoord + vec2( 0.0, -blurOffset.y)).a * 0.125;
    mask += texture2D(gm_BaseTexture, v_vTexcoord + vec2( 0.0,  blurOffset.y)).a * 0.125;
    mask += texture2D(gm_BaseTexture, v_vTexcoord + vec2(-blurOffset.x,  0.0)).a * 0.125;
    mask += texture2D(gm_BaseTexture, v_vTexcoord + vec2( blurOffset.x,  0.0)).a * 0.125;
    
    // Diagonal neighbors
    mask += texture2D(gm_BaseTexture, v_vTexcoord + vec2(-blurOffset.x, -blurOffset.y)).a * 0.0625;
    mask += texture2D(gm_BaseTexture, v_vTexcoord + vec2( blurOffset.x, -blurOffset.y)).a * 0.0625;
    mask += texture2D(gm_BaseTexture, v_vTexcoord + vec2(-blurOffset.x,  blurOffset.y)).a * 0.0625;
    mask += texture2D(gm_BaseTexture, v_vTexcoord + vec2( blurOffset.x,  blurOffset.y)).a * 0.0625;
    
    vec3 glowColor = vec3(u_ColorR, u_ColorG, u_ColorB);
    gl_FragColor = vec4(glowColor * mask * u_Intensity, 1.0);
}