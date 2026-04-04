var _base_y = array_btt[0].y; 
var _target_x = (anim.play_anim == true) ? array_btt[0].x : room_width + 500;

// 1. Update the Master Reference
anim.anim_ext = lerp(anim.anim_ext, _target_x, anim.a_delay);

for (var i = 0; i < array_length(array_btt); i++) {
    
	//var a = i+1
    // Calculate the distance remaining to the goal
    var _dist = _target_x - anim.anim_ext;
    
    // Create a lag that is high at the start and becomes 0 at the end
    // (i * 100) is the max separation. 
    // _dist / _target_x creates a percentage (1.0 at start, 0.0 at end)
    var _current_lag = (i * 300) * (_dist / _target_x);
    
    var _draw_x = anim.anim_ext - _current_lag;
    var _draw_y = _base_y + (i * 300);
    
    // Draw using the staggered calculation
    draw_sprite_ext(array_btt[i].sprite, 0, _draw_x, _draw_y, 2, 2, 0, c_white, 1);
	
	//draw_rectangle(1210,195,1760,295,true)

	
	
}

