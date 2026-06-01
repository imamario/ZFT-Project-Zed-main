var _target_height = camera_get_view_height(camera) / 5;
if (global.cutscene == true) { cutscene_bar = lerp(cutscene_bar,_target_height,0.1) }
else { cutscene_bar = lerp(cutscene_bar,0,0.1) }

if (cutscene_bar<1) && (cutscene_bar>-1)exit;
// 1. Get the current camera position and dimensions
var _cam_x = camera_get_view_x(camera);
var _cam_y = camera_get_view_y(camera);
var _cam_w = camera_get_view_width(camera);
var _cam_h = camera_get_view_height(camera);

// 2. Set the color to black
draw_set_color(c_black);

// 3. Draw the TOP bar
// Stays at the top of the camera view (_cam_y) and extends down by cutscene_bar
var _top_y2 = _cam_y + cutscene_bar;
draw_rectangle(_cam_x, _cam_y, _cam_x + _cam_w, _top_y2, false);

// 4. Draw the BOTTOM bar
// Starts above the bottom edge and extends to the very bottom of the camera view
var _bottom_y1 = (_cam_y + _cam_h) - cutscene_bar;
var _bottom_y2 = _cam_y + _cam_h;
draw_rectangle(_cam_x, _bottom_y1, _cam_x + _cam_w, _bottom_y2, false);

// 5. Reset draw color
draw_set_color(c_white);