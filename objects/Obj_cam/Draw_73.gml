// 1. Get the width and height of the view
var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);

// 2. Calculate the Top-Left corner based on Obj_cam's center
var _x1 = x - (_vw / 2);
var _y1 = y - (_vh / 2);
var _color = c_maroon
var _opacity = 0.6

//red filter for rage time
if raged {
	if trans < _opacity{trans+=0.03}
	draw_set_alpha(trans)
	draw_rectangle_color(_x1, _y1, _x1 + _vw, _y1 + _vh,
	_color,_color,_color,_color,false
	)
	draw_set_alpha(1)
	with(all){image_blend=c_red}
	image_blend=c_white
}

//stating menu before starting the match / pause menu
if (global.state=="paused") {
	
	draw_set_alpha(0.50)
	draw_rectangle_color(_x1, _y1, _x1 + _vw, _y1 + _vh,
		c_black,c_black,c_black,c_black,false
	)
	draw_set_alpha(1)

	draw_sprite_ext(Spr_box,0,_x1,_y1,2.5+0.08,1.5+0.17,0,image_blend,1)
	draw_sprite_ext(Spr_playselection_normal,0,x+30,y+410,1,1,0,c_white,1)


		if mouse_check_button_pressed(mb_left) { 
			//show_message(["mouse_x: " + string(mouse_x - x), "mouse_y: " + string(mouse_y - y)]) 	
			if point_in_rectangle(mouse_x,mouse_y,x-302,y+367,x+357,y+450) { repeat(10) { instance_activate_all() audio_resume_all(); global.state=("running") } }//show_message("initiated!") global.state="running" }
	}
}


if (global.state=="victory") {

	instance_deactivate_all(true) instance_activate_object(Obj_player) instance_activate_object(Obj_debug)
	


}


