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

			case "room_reset":
			
				room_restart()
				
			break;
			
			case "global.state_set":
			
				global.state = (_val_string);
				show_message("Successefully changed to: " + string(global.state));
			
			break;
			
            case "return_menu":
			
				room_goto(Rm_menu);
			
			break;
			
			case "room_goto":
			
				room_goto(_val_string)
		
			break;
			
			case "fish_spawn_switch":
			
			Obj_player.can_spawn=!Obj_player.can_spawn	
			show_message("Obj_player.can_spawn = " + string(Obj_player.can_spawn))
			
			
			break;
			
			case "help":
			
				if show_question("commands: \n global.state_set (value) \n psize_set (value) \n room_reset \n return_menu \n room_goto (value) \n fish_spawn_switch \n Understood all these commands?")
				{show_message("great")} else { show_message("Too bad") }
				
			break;
			
			case "var_print":
			
			var _global_var_name = undefined
		    var _VTP = undefined
			var _dot_pos = undefined
			var _obj_name = undefined
			var _var_name = undefined
			
		    // Check if it's a global variable
		    if (string_pos("global.", _val_string) == 1) {
		        // Cut out the "global." part to get just the variable name
		        _global_var_name = string_delete(_val_string, 1, 7);
		        _VTP = variable_global_get(_global_var_name);
		    } else {
		        // Otherwise, split at the dot (e.g., "Obj_player.hp")
		        _dot_pos = string_pos(".", _val_string);
		        _obj_name = string_copy(_val_string, 1, _dot_pos - 1);
		        _var_name = string_delete(_val_string, 1, _dot_pos);
        
		        // Find the asset ID and get the variable
		        _target_id = asset_get_index(_obj_name);
		        _VTP = variable_instance_get(_target_id, _var_name);
		    }
    
		    print(_VTP);
		    show_message(_val_string + " = " + string(_VTP));
			
			break;
			
			case "spawn_obj":
			
			instance_create_layer(mouse_x,mouse_y,Obj_player.layer,_val_string)
			
			
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


