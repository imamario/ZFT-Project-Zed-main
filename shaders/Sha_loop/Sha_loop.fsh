varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform float u_speed;

void main() {
    vec2 uv = v_vTexcoord;
    
    // Shift the X coordinate (U) over time
    // fract() creates the loop by wrapping values back to 0.0
    uv.x = fract(uv.x + (u_time * u_speed));

    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, uv);
}