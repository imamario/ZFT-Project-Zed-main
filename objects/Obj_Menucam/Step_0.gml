switch(target){

	default:
		target = {
			x: 1015,
			y: 770
		};
		break;
};

xto = target.x
yto = target.y
show_debug_message(target)

x += (xto - x) / 28
y += (yto - y) / 28

// 4. Lock the camera object inside the "Safe Zone" 
// This prevents it from going into "free mode" at the corners
x = clamp(x, cam_width * 0.5, room_width - (cam_width * 0.5));
y = clamp(y, cam_height * 0.5, room_height - (cam_height * 0.5));

// 5. Final positioning (Centered)
camera_set_view_pos(view_camera[0], x - (cam_width * 0.5), y - (cam_height * 0.5));

