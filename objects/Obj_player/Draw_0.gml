// --- 1. SET UP COLORS ---
// Move choose out of the loop so the whole trail flashes together, or keep inside for rainbow
var _trailcolor = choose(c_green, c_lime, #a0db39, #5c9200);

draw_set_font(global.font);

// Ensure _alpha and _value logic is working
// Note: If _xdir is a local variable in Step, you need to make it an instance variable (remove 'var')
if (variable_instance_exists(id, "_xdir")) {
    if (_xdir != 0) { _alpha = 1; }
}

_value = lerp(_value, _alpha, 0.01);

// --- 2. DRAW TRAIL ---
// Reset global alpha to 1 so it doesn't interfere with the ghost's individual alpha
draw_set_alpha(1); 

var _trail_count = array_length(trail_list);
for (var i = 0; i < _trail_count; i++) {
    var _p = trail_list[i];
    var _rang = 5;
    
    // Only draw if alpha is actually visible to save performance
    if (_p.t_alpha > 0) {
        draw_sprite_ext(
            _p.t_sprite, 
            _p.t_frame, 
            _p.t_x + random_range(-_rang, _rang), 
            _p.t_y + random_range(-_rang, _rang), 
            _p.t_xscale,
            _p.t_yscale,
            _p.t_angle, 
            _trailcolor,
            _p.t_alpha // Removed the -0.1 here to prevent instant vanishing
        );
    }
}

// --- 3. DRAW PLAYER ---
// Use the calculated _value alpha for the player if that was your intention, 
// or 1 for a solid player.
draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale, draw_yscale, draw_angle, image_blend, 1);

// Cleanup
draw_set_alpha(1);