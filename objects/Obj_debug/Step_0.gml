

if keyboard_check_pressed(vk_delete) && keyboard_check(vk_alt) { enabled=!enabled keyboard_string="" }

if enabled {
/*
	var _input = "hp_set 100"; // Example string from your console input
	var _args = string_split(_input, " "); // Splits at the space

		
	switch(keyboard_string) {
		
		default:
			show_message("Error, Incorrect Command!")
		break;
		
		case "psize_set":
        // Convert the second part of the array to a number (real)
        if (array_length(_args) > 1) {
            hp = real(_args[1]);
        }
        break;
	
	
	
	}

*/


if (keyboard_check_pressed(vk_enter)) {
    try {
        // 1. First, find the space position
        var _space_pos = string_pos(" ", keyboard_string);
        var _actual_cmd = "";
        var _val_string = "";

        // 2. Identify the command and the value string
        if (_space_pos == 0) {
            _actual_cmd = keyboard_string;
        } else {
            _actual_cmd = string_copy(keyboard_string, 1, _space_pos - 1);
            _val_string = string_delete(keyboard_string, 1, _space_pos);
        }

        // 3. Execute logic
        switch(_actual_cmd) {
            case "psize_set":
                global.size = real(_val_string);
				show_message(global.size);
            break;
            
            case "spawn_enemie":
                // Convert string to actual Object ID
                var _obj_id = asset_get_index(_val_string);
                if (object_exists(_obj_id)) {
                    instance_create_layer(mouse_x, mouse_y, "enemies", _obj_id);
                } else {
                    show_debug_message("Object not found!");
                }
            break;

            default:
                show_debug_message("Unknown command: " + _actual_cmd);
            break;
        }

        keyboard_string = ""; 
    }
    catch(_error) {
        show_message(_error);
    }
}
	
	
	
		//ance_deactivate_object(Obj_cam)
		instance_deactivate_object(Obj_wall)
		instance_destroy(Obj_fish)
		instance_deactivate_object(Obj_fish)
		
	
	
	}
	else 
	{ instance_activate_all() }


