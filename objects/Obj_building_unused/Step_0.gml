// 1. GRID SNAPPING
// This forces the mouse coordinates to stick to a 32x32 grid
var _grid = 32; 
var _snapped_x = (mouse_x div _grid) * _grid;
var _snapped_y = (mouse_y div _grid) * _grid;

// 2. SELECTION LOGIC
// Cycle through sprites with the Mouse Wheel
if (mouse_wheel_up()) cur_select++;
if (mouse_wheel_down()) cur_select--;

// Keep cur_select within the bounds of your sprite array (0 to length-1)
if (cur_select < 0) cur_select = array_length(sprite) - 1;
if (cur_select >= array_length(sprite)) cur_select = 0;

selected = sprite[cur_select];
show_debug_message(cur_select )
// 3. PLACEMENT (Left Click)
if (mouse_check_button(mb_left) && building_mode) {
    var _exists = false;
    
    // Optimization: Check if a block is already at this grid position
    for (var i = 0; i < array_length(click_positions); i++) {
        if (click_positions[i].x_pos == _snapped_x && click_positions[i].y_pos == _snapped_y) {
            _exists = true;
            break;
        }
    }
    
    // Only add a new block if the space is empty
    if (!_exists) {
        var _data = {
            x_pos: _snapped_x,
            y_pos: _snapped_y,
            spr: selected,
            background: added_img,
            AtlasFG: noone,
            AtlasBG: noone,
            Spr1: undefined
        };
        array_push(click_positions, _data);
    }
}

// 4. ERASER (Right Click)
if (mouse_check_button(mb_right) && building_mode) {
    // Loop BACKWARDS to safely delete from the array
    for (var i = array_length(click_positions) - 1; i >= 0; i--) {
        var _inst = click_positions[i];
        if (_inst.x_pos == _snapped_x && _inst.y_pos == _snapped_y) {
            array_delete(click_positions, i, 1);
            break; // Stop looking after deleting one
        }
    }
}

// 5. CAMERA MOVEMENT (WASD)
movex = (-keyboard_check(ord("A")) + keyboard_check(ord("D"))) * 10;
movey = (-keyboard_check(ord("W")) + keyboard_check(ord("S"))) * 10;
if keyboard_check_pressed(ord("X")){cur_select++}
if keyboard_check_pressed(ord("C")){cur_select--}

x += movex;
y += movey;

// Keep the camera inside the room boundaries
x = clamp(x, cam_width * 0.5, room_width - (cam_width * 0.5));
y = clamp(y, cam_height * 0.5, room_height - (cam_height * 0.5));

camera_set_view_pos(view_camera[0], x - (cam_width * 0.5), y - (cam_height * 0.5));