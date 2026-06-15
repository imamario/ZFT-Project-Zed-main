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

//drawing hand animation:
//print(game_name.img)
/*
draw_sprite_ext(Spr_tittle,game_name.img,game_name.x,game_name.y,1.792657,1.707495,0,c_white,1)
draw_sprite_ext(Spr_flushstuff,0,530,hand.y,1.85,1.90,0,c_white,1)
*/


//print("mouse_positions: " + string([mouse_x,mouse_y]))
//if mouse_check_button(mb_right) { clipboard_set_text([mouse_x,mouse_y]) }
//900 is the y that the hand should be stoppen to then go back from its initial point

//[ 606,1051.00 ]

if mouse_check_button(mb_right) { clipboard_set_text([mouse_x,mouse_y]) }
switch(hand_state) {
	
	case "naming":
	
		//game_name.x = hand.x
		//game_name.y = hand.y+150
	
		hand.y = lerp(hand.y,901,0.1)
		
		if (hand.y>900) { hand_state = "backing_hand" }	
	
	break;
	
	
	case "backing_hand":
	
	var _y_level = 990.00
	
		game_name.x = lerp(game_name.x,606,0.1)
		game_name.y = lerp(game_name.y,_y_level,0.25)
		
		if (game_name.y == _y_level) {
		
		hand.yspd+=hand.grav
		//hand.yspd=clamp(hand.yspd,10,-9999)
		
		hand.y+=hand.yspd
		}else{hand.y = game_name.y-200 }//print("not_yet")}
		
		/*
		if (hand.yspd!=0) && (hand.y > room_height+1000)
		{  hand_state = "coughing" }
		*/
		
		
		
		
	
	
	
	break;
	
	
	
	
	
}

draw_sprite_ext(Spr_tittle, game_name.index, game_name.x, game_name.y, 1.792657, 1.707495, 0, c_white, 1) //tittle
draw_sprite_ext(Spr_flushstuff, 0, hand.x, hand.y, 3, 3, 0, c_white, 1) //hand





















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





