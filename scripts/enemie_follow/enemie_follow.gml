/// @description object_follow( Object, Speed, Range, turn_offset, Turn_image, show_message);
/// @param Object
/// @param Speed
/// @param range
/// @param Turn_image_offset
/// @param Turn_image?
/// @param Show values?

function object_follow(_obj,_speed,_range,_offset,_turn,_show){
	
	_nearest= instance_nearest(x, y, _obj);
	distance_p = point_distance(x,y,_nearest.x,_nearest.y);
	
	if (distance_p<_range) {
		
		move_towards_point(_obj.x,_obj.y,_speed)
		if _turn{image_angle=lerp(image_angle,point_direction(x,y,_nearest.x,_nearest.y)+_turn,0.05)}

		return true
		
	} else {
		
		speed=0
		if _show { show_debug_message(distance_p) } 
		return false
	}
	
}

