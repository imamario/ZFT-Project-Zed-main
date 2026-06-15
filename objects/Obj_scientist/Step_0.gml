



var _speed     = 1.5;     // How fast it moves (higher = faster)
var _distance  = 30;      // How many pixels up and down it travels
var _asymmetry = 1;       // 1 = perfectly smooth. Increase for a snappy "bounce" effect.

switch(curstate) {
	
case AKSTATE.INTRO:
	
	if keyboard_check(vk_anykey) { skipping+=0.03 } else { skipping = 0 }
	
	//if (global.state="cutscene"){ with(Obj_cutplayer) { target = {x: Obj_scientist.pos.x,y: Obj_scientist.pos.y}; } }
	
	if (pos.x<1800) {
	pos.y = lerp(pos.y,wave_advanced(current_time, _speed, _distance, room_height/2, _asymmetry),0.1)
	pos.x += 20
	}else{
		var _goto = (room_height/2)+301
		
		//print("pos values x and y: " + string([pos.x,pos.y]))
		//print(pos.y)
		//lerp_to(pos.x,(room_width/2+1),0.1)
		//pos.x = lerp(pos.x,room_width/2,0.1)
		pos.y = lerp(pos.y,_goto,0.1)
		
		//if (pos.y>_goto-1) { with(Obj_player) { exe_end() } } else { }//print(pos.y) }
		
		
		if (point_distance(pos.x,pos.y,pos.x,_goto)<20) {
		
			//print("JLKGSNDLIGNISNMDF")
			skipping = 0
			if instance_exists(Obj_cutplayer) { with(Obj_cutplayer) { exe_end() } }
			curstate = AKSTATE.CLAW

			
		}
		
		
		
		
		
	}
	
	
	
	

break;
	
	
	
}