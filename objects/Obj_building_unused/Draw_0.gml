/*draw_self();

// 1. Loop through our array and draw every saved block
for (var i = 0; i < array_length(click_positions); i++) {
    
    // Get the struct at the current index
    var _cell = click_positions[i];
    
    // Draw the specific sprite saved in that struct, at its saved coordinates
    draw_sprite(_cell.spr, 0, _cell.x_pos, _cell.y_pos); 
}

// 2. Draw the transparent preview on your mouse
if (building_mode) {
    draw_sprite_ext(selected, 0, mouse_x, mouse_y, 1, 1, 0, c_white, 0.5);
}
*/

// 1. Draw all placed blocks
for (var i = 0; i < array_length(click_positions); i++) {
    var _cell = click_positions[i];
    draw_sprite(_cell.spr, 0, _cell.x_pos, _cell.y_pos); 
}

// 2. Draw Snapped Preview
if (building_mode) {
    var _snapped_x = (mouse_x div grid_size) * grid_size;
    var _snapped_y = (mouse_y div grid_size) * grid_size;
    
    draw_sprite_ext(selected, 0, _snapped_x, _snapped_y, 1, 1, 0, c_white, 0.5);
}