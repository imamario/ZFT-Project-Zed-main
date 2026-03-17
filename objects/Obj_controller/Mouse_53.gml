if (mouse_y + 70 < Obj_divider.y)
{
    if (!collision_point(mouse_x, mouse_y, Obj_draggable, 0, false))
    {
        with (instance_create(mouse_x, mouse_y, Obj_draggable))
        {
            sprite_index = Spr_selectable;
            image_index = global.selected;
            grabbed = true;
        };
    };
};

