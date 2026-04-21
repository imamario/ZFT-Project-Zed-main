attribute vec3 in_Position;                  
attribute vec4 in_Colour;                    
attribute vec2 in_TextureCoord;              

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time; 

void main()
{
    vec4 pos = vec4(in_Position, 1.0);
    
    // Low frequency (1.2) for a slow drift, small multiplier (4.0) for subtle movement
    // (1.0 - in_TextureCoord.y) ensures the root/bottom doesn't move
    float sway = sin(u_time * 1.2 + (pos.y * 0.03)) * 4.0;
    pos.x += sway * (1.0 - in_TextureCoord.y);

    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}