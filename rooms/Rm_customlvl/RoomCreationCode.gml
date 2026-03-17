if (file_exists("world.ini"))
{
    var worldLoadFile = file_text_open_read("world.ini");
    if (!file_text_eof(worldLoadFile))
    {
        var worldMasterData = file_text_read_string(worldLoadFile);
        var wordArray = scr_string_split(worldMasterData, "|");
        var draggableCount = array_length_1d(wordArray);
        
        if (draggableCount > 0)
        {
            for (var i = 0; i < draggableCount; i++)
            {
                var draggableJson = wordArray[i];
                
                var draggableMap = json_decode(draggableJson);
                
                var _x = ds_map_find_value(draggableMap, "x");
                var _y = ds_map_find_value(draggableMap, "y");
                var _imageIndex = ds_map_find_value(draggableMap, "image_index");
                
                if (_imageIndex != 13)
                {
                    var block = instance_create(_x, _y , obj_block);
                    
                    // offset slightly as tileset origin is at x = 0 and y = 0
                    _x -= sprite_get_width(Spr_selectable)/2;
                    _y -= sprite_get_width(Spr_selectable)/2;
                    
                    switch(_imageIndex)
                    {
                        case 0:
                            instance_create_layer(_x,_y,"Instances",Obj_player)
                        break;
                        
                        case 1:
                            instance_create_layer(_x,_y,"Instances",Obj_player)
                        break;
                    }
                }
                else
                {
                    instance_create(_x, _y, obj_player);
                }
 
                ds_map_destroy(draggableMap);
            }
        }
    }
    
    file_text_close(worldLoadFile);
}