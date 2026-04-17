var _trailcolor = choose(c_green,c_lime,#a0db39,#5c9200)
/*
switch(room){
	
	default:
		_trailcolor = choose(c_green,c_lime,#a0db39,#5c9200)
	break;
	
	case Rm_HungryShark:
		_trailcolor = c_white
	break;
	
	case Rm_FeedFreenzy:
		_trailcolor = c_white
	break;
	
}
*/

draw_set_font(global.font);
if _xdir!=0{_alpha=1}
_value = lerp(_value,_alpha,0.01)
_color++
if _color>255{_color=0}


draw_set_alpha(_value)
//shader_set(Sha_redglow)
// 1. Draw the ghost trail FIRST (so it goes behind the player)
for (var i = 0; i < array_length(trail_list); i++) {
    var _p = trail_list[i];
    var _rang = 5
	var _scal = 0.5
	
    draw_sprite_ext(
        _p.t_sprite, 
        _p.t_frame, 
        _p.t_x+random_range(-_rang,_rang), 
        _p.t_y+random_range(-_rang,_rang), 
        _p.t_xscale,
        _p.t_yscale,
        _p.t_angle, 
		_trailcolor,
        _p.t_alpha-0.1
    );
}
draw_set_alpha(1)
//shader_reset()
// 2. Draw the actual player ON TOP of the trail
draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale, draw_yscale, draw_angle, image_blend, 1);
//print("final xscale: " +string(draw_xscale))

/*
draw_set_alpha(0.1)
draw_circle(x,y,_range,false)
draw_set_alpha(1)
*/


/*
// Your combo text code (left commented out as it was in your snippet)
draw_set_alpha(alarm[1])
draw_text_scribble(Obj_cam.x+500,Obj_cam.y+200,"[wobble][wave][pulse][wheel][scaleStack,1.5]" + string(combo_info[1]) + "[/scale]x[/wheel][/pulse][/wave][/wobble]")
draw_set_alpha(1)
*/
//aw_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_top,false)