var _base_y = array_btt[0].y; 
var _target_x = (anim.play_anim == true) ? array_btt[0].x : room_width + 500;

// Update the Master Reference
anim.anim_ext = lerp(anim.anim_ext, _target_x, anim.a_delay);

for (var i = 0; i < array_length(array_btt); i++) {
    // Calculate the distance remaining to the goal
    var _dist = _target_x - anim.anim_ext;
    
    // Create a lag that is high at the start and becomes 0 at the end
    var _current_lag = (i * 300) * (_dist / _target_x);
    
    var _draw_x = anim.anim_ext - _current_lag;
    var _draw_y = _base_y + (i * 300);
    
    // Draw using the staggered calculation
    draw_sprite_ext(array_btt[i].sprite, 0, _draw_x, _draw_y, 2, 2, 0, c_white, 1);
}

// --- ACTUAL FADE DRAWING ---
// Fade In at the start
if (starting > 0) {
    draw_set_alpha(starting);
    draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
}

// Fade Out when a button is clicked
if (ending > 0) {
    draw_set_alpha(ending);
    draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
}