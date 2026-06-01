/// @function                   wave_advanced(time, frequency, amplitude, center, asymmetry)
/// @description                Generates a highly customizable wave value.
/// @param {real} time          The tracking variable (usually 'current_time' or an incremental variable).
/// @param {real} frequency     How fast the wave cycles (higher = faster).
/// @param {real} amplitude     How far the wave extends from the center.
/// @param {real} center        The baseline/starting value of the wave.
/// @param {real} asymmetry     1 for normal sine wave. Higher values (e.g., 2 or 3) create sharp peaks and flat valleys.
function wave_advanced(_time, _frequency, _amplitude, _center, _asymmetry = 1) {
    
    // Convert time and frequency into a moving radian angle
    var _angle = (_time * 0.001 * _frequency) * pi * 2;
    
    // Get the standard sine wave value (-1 to 1)
    var _raw_sine = sin(_angle);
    
    // Apply asymmetry if requested (shapes the wave curve)
    if (_asymmetry != 1) {
        if (_raw_sine > 0) {
            _raw_sine = power(_raw_sine, _asymmetry);
        } else {
            _raw_sine = -power(abs(_raw_sine), 1 / _asymmetry);
        }
    }
    
    // Scale and shift the wave into its final range
    return _center + (_raw_sine * _amplitude);
}
