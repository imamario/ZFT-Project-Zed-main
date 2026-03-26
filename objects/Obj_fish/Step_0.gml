


switch(type){
	
	case  1:
	if size>global.size{
	
	var _range = 500
	var _distance = point_distance(x,y,Obj_player.x,Obj_player.y)
	
	 if sign(hspd)>0 {
		 
		if !object_follow( Obj_player, hspd, _range, 0, false, false ) {image_angle=0 x+=hspd}
	 
	 }else{
		 
		if !object_follow( Obj_player, -hspd, _range, 180, false, false ) {image_angle=0 x+=hspd}
		
		}
	 
	}else{x+=hspd}
	break;

	case 2:
	
	if turn!=0{turn-=0.1}else{turn=round(random_range(100,220))}
	if turn=0.1{image_xscale=-image_xscale hspd=-hspd}
	x+=hspd
	
	break;

}





// Increment the time variable to animate the wave
time += 0.05;












if x=room_width+600 || x=-500{instance_destroy()};