var _speed     = 1.5;     // How fast it moves (higher = faster)
var _distance  = 30;      // How many pixels up and down it travels
var _asymmetry = 1;       // 1 = perfectly smooth. Increase for a snappy "bounce" effect.

switch(curstate) {
	
case AKSTATE.INTRO:
	
	
	global.state="cutscene"
	
	if (x<room_width/2) {
	pos[1] = lerp(pos[1],wave_advanced(current_time, _speed, _distance, room_height/2, _asymmetry),0.1)
	pos[0] += 20
	}else{
		
		
		
		
		
	}
	
	
	
	

break;
	
	
	
}