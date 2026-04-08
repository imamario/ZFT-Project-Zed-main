varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;      // The essential "clock" from GML
uniform float u_strength;  // How far the pixels jump (try 0.05)

float rand(vec2 co) {
    return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

void main() {
    vec2 uv = v_vTexcoord;
    
    // Create moving horizontal blocks
    // We mix Y coordinate and Time so the blocks shift up/down
    float group = floor((uv.y + u_time) * 10.0);
    
    // Check if this horizontal slice should glitch
    if (rand(vec2(group, u_time)) > 0.7) {
        // Apply a random horizontal shift
        uv.x += (rand(vec2(u_time, group)) - 0.5) * u_strength;
    }

    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, uv);
}