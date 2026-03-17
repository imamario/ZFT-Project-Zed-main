movex = (-keyboard_check(ord("A")) + keyboard_check(ord("D"))) * 10;
movey = (-keyboard_check(ord("W")) + keyboard_check(ord("S"))) * 10;

x += movex;
y += movey;

// Keep the camera inside the room boundaries
x = clamp(x, cam_width * 0.5, room_width - (cam_width * 0.5));
y = clamp(y, cam_height * 0.5, room_height - (cam_height * 0.5));

camera_set_view_pos(view_camera[0], x - (cam_width * 0.5), y - (cam_height * 0.5));