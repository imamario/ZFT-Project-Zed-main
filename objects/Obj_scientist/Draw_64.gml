
draw_set_alpha(skipping)
draw_set_color(c_black)
draw_rectangle(0,0,room_width,room_height,false)



if (skipping>2) { 			
			
			
			curstate = AKSTATE.CLAW
			pos.x = room_width/2
			pos.y = (room_height/2)+301
			if instance_exists(Obj_cutplayer) { with(Obj_cutplayer) { exe_end() } }
			skipping = 0
			
}
			
draw_set_color(c_white)
draw_set_alpha(1)