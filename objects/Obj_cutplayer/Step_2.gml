if !is_struct(target){
	// 1. Identify the target (e.g., your player)
	if (instance_exists(target)) {
	
	    var _target_x = target.x - (view_width / 2);
	    var _target_y = target.y - (view_height / 2);
		_target_x = clamp(_target_x,0,room_width)
	    _target_y = clamp(_target_y,0,room_height)

	    // 2. Get current camera position
	    var _cur_x = camera_get_view_x(camera);
	    var _cur_y = camera_get_view_y(camera);

	    // 3. Smoothly move camera using lerp
	    var _new_x = lerp(_cur_x, _target_x, lerp_speed);
	    var _new_y = lerp(_cur_y, _target_y, lerp_speed);
		_new_x = clamp(_new_x,0,room_width)
		_new_y = clamp(_new_y,0,room_height)
	
	    // 4. Update the camera
	    camera_set_view_pos(camera, _new_x, _new_y);

	}
}else{
	
		// 1. Identify the target (e.g., your player)
	if (instance_exists(target.Object)) {
	
	    var _target_x = target.x - (view_width / 2);
	    var _target_y = target.y - (view_height / 2);
		_target_x = clamp(_target_x,0,room_width)
	    _target_y = clamp(_target_y,0,room_height)

	    // 2. Get current camera position
	    var _cur_x = camera_get_view_x(camera);
	    var _cur_y = camera_get_view_y(camera);

	    // 3. Smoothly move camera using lerp
	    var _new_x = lerp(_cur_x, _target_x, lerp_speed);
	    var _new_y = lerp(_cur_y, _target_y, lerp_speed);
		_new_x = clamp(_new_x,0,room_width)
		_new_y = clamp(_new_y,0,room_height)
	
	    // 4. Update the camera
	    camera_set_view_pos(camera, _new_x, _new_y);

	}
	
	
	
	
	
	
	
	
	
}