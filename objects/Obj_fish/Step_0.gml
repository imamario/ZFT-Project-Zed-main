var _sprite_width = sprite_get_width(sprite_index)

if !instance_exists(Obj_player)exit;
if (global.state=="paused")exit;
if (size < global.size) || (size == global.size) {

	eatable=true
	
}	else  if  (size > global.size) { eatable=false }





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
	
	var _range = 100
	var _predator = instance_nearest(x,y,Obj_fish)
	
	
	if turn!=0{turn-=0.1}else{turn=round(random_range(100,220))}
	if turn=0.1{draw_size=-draw_size hspd=-hspd} 
	x+=hspd
	
	
	//interaction to escape if nearby a predator is near
	if !eatable && (point_distance(x,y,Obj_fish.x,Obj_fish.y) < _range) {
		
		if (_predator.size!=0.5) {
		
				if (_predator.y>y) {
				
					y+=vspd
					vspd-=0.1
				
				}
			
				if (_predator.y<y) {
				
					y+=vspd
					vspd+=0.1
				
				}
			}
	
		}else{
		
		vspd = 0
		y=wave_advanced(current_time,0.1,100,ystart)
	
	}
	
	//
	
	
	
	
	
	
	break;
	
	case 3:
	
	x+=hspd
	
	/*
	if eatable!=true && (point_distance(x,y,Obj_player.x,Obj_player.y)<500){
		time+=0.05
		if (Obj_player.y>y){ y+=(time/10) }else{ y-=(time/10) }
		}]
	*/
	
	
	
	break;
	
	case 4:
	
	//grouper fish
	x+=hspd
	y=wave_advanced(current_time,0.1,325,ystart)
	
	
	var _range_group = sprite_width*2
	var _speed = 10
	
	var _friend = instance_find(Obj_fish, instance_number(Obj_fish) - 1)
	
	if (_friend.size = 0.5) && size=0.5  {
	
		image_blend = c_red
	
		if (point_distance(x,y,_friend.x,_friend.y)<_range_group){
		
		_friend.hspd = lengthdir_x(_speed,point_direction(_friend.x,_friend.y,x,y))
		_friend.vspd = lengthdir_y(_speed,point_direction(_friend.x,_friend.y,x,y))

		}
	
	
	
	}	
	
	
	
	
	
	
	
	break;

}





// Increment the time variable to animate the wave
time += 0.05;

image_xscale=lerp(image_xscale,draw_size,0.05)
//image_yscale=lerp(image_yscale,size,0.1)
if instance_exists(Obj_cam){
	if Obj_cam.raged{image_blend=c_red}
}

if x>room_width+_sprite_width || x<-_sprite_width{instance_destroy()};