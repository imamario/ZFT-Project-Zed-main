if keyboard_check(vk_control) && keyboard_check(ord("S")){

var draggableCount = instance_number(Obj_draggable);

if (file_exists("world.ini"))
{
    file_delete("world.ini");
}

var saveFile = file_text_open_write("world.ini");
for (var i = 0; i < draggableCount; i++)
{
    var instance = instance_find(Obj_draggable, i);
    
    // convert this instance into a ds_map
    var instanceMap = ds_map_create();
    ds_map_add(instanceMap, "x", instance.x);
    ds_map_add(instanceMap, "y", instance.y);
    ds_map_add(instanceMap, "image_index", instance.image_index);
    
    // convert ds_map into JSON
    JsonInstance = json_encode(instanceMap);
    
    file_text_write_string(saveFile, JsonInstance);
    file_text_write_string(saveFile, "|");
    
    ds_map_destroy(instanceMap);
}

// close the file
file_text_close(saveFile);
show_message("Level saved press Esc to return to MainMenu and test it!!")
}


if keyboard_check_pressed(vk_escape){
	if show_question_async("are sure you wanna leave to main menu? make sure to Ctrl + S before leaving!!!!"){
		//om_goto(Rm_main);
	}
}



