varying vec4 v_vColour;
varying vec2 v_vTexcoord;

uniform float u_time;
uniform float u_amplitude;
uniform float u_frequency;
uniform float u_speed;

void main()
{
    // Calculate the wave offset based on the x-coordinate
    // We swap v_vTexcoord.x and v_vTexcoord.y from the previous version
    float waveOffset = sin((v_vTexcoord.x * u_frequency) + (u_time * u_speed)) * u_amplitude;

    // Adjust the y-coordinate by the wave offset
    vec2 offsetTexCoord = vec2(v_vTexcoord.x, v_vTexcoord.y + waveOffset);

    // Get the color from the texture at the new, offset coordinates
    vec4 texColour = texture2D(gm_BaseTexture, offsetTexCoord);

    // Output the final color, mixing with the vertex color
    gl_FragColor = texColour * v_vColour;
}