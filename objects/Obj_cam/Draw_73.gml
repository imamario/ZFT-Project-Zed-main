if (global.cutscene) exit;
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
	
	if matchstate=="starting"  {
		draw_set_alpha(0.50)
		draw_rectangle_color(_x1, _y1, _x1 + _vw, _y1 + _vh,
			c_black,c_black,c_black,c_black,false
		)
		draw_set_alpha(1)

		draw_sprite_ext(Spr_box,0,_x1,_y1,2.5+0.08,1.5+0.17,0,image_blend,1)
		draw_sprite_ext(Spr_playselection_normal,0,x+30,y+410,1,1,0,c_white,1)


			if mouse_check_button_pressed(mb_left) { 
				//show_message(["mouse_x: " + string(mouse_x - x), "mouse_y: " + string(mouse_y - y)]) 
				matchstate="running"
				if point_in_rectangle(mouse_x,mouse_y,x-302,y+367,x+357,y+450) { repeat(10) { instance_activate_all() audio_resume_all(); global.state=("running") } }//show_message("initiated!") global.state="running" }
		}
	
	}else{
	
			draw_set_alpha(0.50)
		draw_rectangle_color(_x1, _y1, _x1 + _vw, _y1 + _vh,
			c_black,c_black,c_black,c_black,false
		)
		draw_set_alpha(1)
		
		
		//aw_sprite_ext(Spr_playselection_normal,0,x+30,y+410,1,1,0,c_white,1)
		
		if check_click_btt( x-300, y-265, x+360, y-180 ) { //resume button

			global.state=previous_state
			
		}
		
		
		if check_click_btt( x-300, y-70, x+360, y+20 ) { //restart button

			room_restart()
			
		}
		
		
		if check_click_btt( x-300, y+130, x+360, y+220 ) { //exit button

			room_goto(Rm_levelselect)
			
		}
	
/*
			if mouse_check_button_pressed(mb_left) { 
				show_message(["mouse_x: " + string(mouse_x - x), "mouse_y: " + string(mouse_y - y)]) 
				matchstate="running"
				if point_in_rectangle(mouse_x,mouse_y,x-302,y+367,x+357,y+450) { repeat(10) { instance_activate_all() audio_resume_all(); global.state=("running") } }//show_message("initiated!") global.state="running" }
	}
*/
	
	//draw buttons
	draw_sprite_ext(Spr_box,0,_x1,_y1,2.5+0.08,1.5+0.17,0,image_blend,1)
	
	for(var _i = 0; _i < 3; _i++) {
	var _ydraw_pos = (200 * _i)
	
	draw_sprite_ext(Spr_match_gamebuttons,_i,x+30,y-230+_ydraw_pos,1,1,0,c_white,1)
	//print(mouse_y)
	draw_text_scribble(x+15,y-442,"[fnt_alarm][scaleStack,3]GAME PAUSED")
	
	
	}
	
	
	
	
	}
		
		
		
	
	
	
}


if (global.state=="victory") {
	
	var _button = [Spr_playagain,Spr_playnext]
	var _sidebutton = [Spr_menu,Spr_upgrades]
	
	
	instance_destroy(Obj_fish);
	instance_deactivate_all(true); instance_activate_object(Obj_player);
	instance_activate_object(__InputUpdateController); instance_activate_object(Obj_debug);
	
	
		
	draw_set_alpha(0.25)
	draw_rectangle_color(_x1, _y1, _x1 + _vw, _y1 + _vh,c_red,c_red,c_red,c_red,false)
	draw_rectangle_color(_x1, _y1, _x1 + _vw, _y1 + _vh,c_black,c_black,c_black,c_black,false)
	draw_set_alpha(1)
	
	
	
	draw_sprite_ext(Spr_box,0,_x1,_y1,2.5+0.08,1.5+0.17,0,image_blend,1)
	draw_sprite_ext(Spr_playselection_normal,0,x+30,y+410,1,1,0,c_white,1)

		



	
	
	
	
	
	


}


