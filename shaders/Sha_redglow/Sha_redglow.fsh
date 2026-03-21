// Custom_RedSaturation.fsh
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    // Sample the base texture
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    
    // Calculate average luminance (the 'x' variable from the Unity shader)
    float luminance = (texColor.r + texColor.g + texColor.b) / 3.0;
    
    // Create the pure grayscale base
    vec3 bw = vec3(luminance);
    
    // Create the boosted red output (multiplies red by 2, strips green and blue)
    vec3 redBoost = vec3(texColor.r * 2.0, 0.0, 0.0);
    
    // Calculate the isolation mask:
    // Subtracts a bit of G and B from R so only true red pixels get masked
    float redMask = clamp(texColor.r - ((texColor.g + texColor.b) * 0.2), 0.0, 1.0);
    
    // First blend: Apply the boosted red only where the mask is active
    vec3 finalColor = mix(bw, redBoost, redMask);
    
    // Second blend: Wash out extremely bright/white areas back toward grayscale
    finalColor = mix(finalColor, bw, luminance);
    
    // Output final color, factoring in GameMaker's built-in image_blend (v_vColour)
    gl_FragColor = v_vColour * vec4(finalColor, texColor.a);
}