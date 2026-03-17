xx = -200;
yy = 0;

// place selectables
for (var i = 0; i < 5; i++)
{
    with (instance_create(xx, yy, Obj_selectable))
    {
        if (i == 0)
        {
            sprite_index = Spr_selectable_selected;
        }
        else
        {
            sprite_index = Spr_selectable;
        }
        
        image_index = i;
    }
    
    xx += 110;
}

/*
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
                
                var draggable = instance_create(_x, _y, Obj_draggable);
                draggable.sprite_index = Spr_selectable;
                draggable.image_index = _imageIndex;
                
                ds_map_destroy(draggableMap);
            }
        }
    }
    
    file_text_close(worldLoadFile);
}