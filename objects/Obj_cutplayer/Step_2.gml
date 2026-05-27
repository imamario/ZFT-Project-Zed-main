// 1. Identify the target (e.g., your player)
if (instance_exists(Obj_cutplayer)) {
    var _target_x = Obj_cutplayer.x - (view_width / 2);
    var _target_y = Obj_cutplayer.y - (view_height / 2);

    // 2. Get current camera position
    var _cur_x = camera_get_view_x(camera);
    var _cur_y = camera_get_view_y(camera);

    // 3. Smoothly move camera using lerp
    var _new_x = lerp(_cur_x, _target_x, lerp_speed);
    var _new_y = lerp(_cur_y, _target_y, lerp_speed);

    // 4. Update the camera
    camera_set_view_pos(camera, _new_x, _new_y);
}