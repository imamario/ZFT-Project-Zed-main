/// @desc Camera draw_end event (organized)

// ============================================================
// EARLY EXIT
// ============================================================
//if (global.cutscene) && global.state!="paused" && matchstate=="starting" exit;

// ============================================================
// VIEW BOUNDS (top-left corner of camera view, used everywhere below)
// ============================================================
var _cam_x = camera_get_view_x(cam);
var _cam_y = camera_get_view_y(cam);
var _cam_w = camera_get_view_width(cam);
var _cam_h = camera_get_view_height(cam);
var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);

var _x1 = x - (_vw / 2);
var _y1 = y - (_vh / 2);

// ============================================================
// RAGE TIME — red screen flash + red image_blend on everything
// ============================================================
var _color   = c_maroon;
var _opacity = 0.6;

if (raged) {
	if (trans < _opacity) trans += 0.03;

	draw_set_alpha(trans);
	draw_rectangle_color(_x1, _y1, _x1 + _vw, _y1 + _vh, _color, _color, _color, _color, false);
	draw_sprite_ext(Spr_blood,0,x,y,image_xscale,image_yscale,0,c_white,0.5)
	
	draw_set_alpha(1);

	with (all) { image_blend = c_red; }
	image_blend = c_white;
	
	
	
	
}



//run the cinematic movie bars
var _target_height = camera_get_view_height(cam) / 5;
if (global.cutscene == true) { cutscene_bar = lerp(cutscene_bar,_target_height,0.1) }
else { cutscene_bar = lerp(cutscene_bar,0,0.1) }

if (cutscene_bar >= 1 || cutscene_bar <= -1) {


	draw_set_color(c_black);
	draw_rectangle(_cam_x, _cam_y, _cam_x + _cam_w, _cam_y + cutscene_bar, false);
	draw_rectangle(_cam_x, (_cam_y + _cam_h) - cutscene_bar, _cam_x + _cam_w, _cam_y + _cam_h, false);
	draw_set_color(c_white);
}

// 2. Set the color to black
draw_set_color(c_black);

// 3. Draw the TOP bar
// Stays at the top of the cam view (_cam_y) and extends down by cutscene_bar
var _top_y2 = _cam_y + cutscene_bar;
draw_rectangle(_cam_x, _cam_y, _cam_x + _cam_w, _top_y2, false);

// 4. Draw the BOTTOM bar
// Starts above the bottom edge and extends to the very bottom of the cam view
var _bottom_y1 = (_cam_y + _cam_h) - cutscene_bar;
var _bottom_y2 = _cam_y + _cam_h;
draw_rectangle(_cam_x, _bottom_y1, _cam_x + _cam_w, _bottom_y2, false);

// 5. Reset draw color
draw_set_color(c_white);




// ============================================================
// PAUSE / PRE-MATCH MENU
// ============================================================
if (global.state == "paused") {

	if (matchstate == "starting") {

		// --- Pre-match "ready to start" screen ---
		draw_set_alpha(0.50);
		draw_rectangle_color(_x1, _y1, _x1 + _vw, _y1 + _vh, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);

		draw_sprite_ext(Spr_box, 0, _x1, _y1, 2.5 + 0.08, 1.5 + 0.17, 0, image_blend, 1);
		draw_sprite_ext(Spr_playselection_normal, 0, x + 30, y + 410, 1, 1, 0, c_white, 1);

		if (mouse_check_button_pressed(mb_left)) {
			

			if (point_in_rectangle(mouse_x, mouse_y, x - 302, y + 367, x + 357, y + 450)) {
				
				
				matchstate = "running";
				event_user(0)
				
				
				repeat (10) {
					instance_activate_all();
					audio_resume_all();
					global.state = "running";
				}
			}
		}

	} else {

		// --- Standard pause menu ---
		draw_set_alpha(0.50);
		draw_rectangle_color(_x1, _y1, _x1 + _vw, _y1 + _vh, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);

		// Buttons
		if (check_click_btt(x - 300, y - 265, x + 360, y - 180)) { // Resume
			global.state = previous_state;
		}

		if (check_click_btt(x - 300, y - 70, x + 360, y + 20)) { // Restart
			room_restart();
		}

		if (check_click_btt(x - 300, y + 130, x + 360, y + 220)) { // Exit to level select
			room_goto(Rm_levelselect);
		}

		// Panel background + title
		draw_sprite_ext(Spr_box, 0, _x1, _y1, 2.5 + 0.08, 1.5 + 0.17, 0, image_blend, 1);

		for (var _i = 0; _i < 3; _i++) {
			var _ydraw_pos = 200 * _i;
			draw_sprite_ext(Spr_match_gamebuttons, _i, x + 30, y - 230 + _ydraw_pos, 1, 1, 0, c_white, 1);
		}

		draw_text_scribble(x + 15, y - 442, "[fnt_alarm][scaleStack,3]GAME PAUSED");
	}
}

// ============================================================
// VICTORY SCREEN
// ============================================================
if (global.state == "victory") {

	var _button     = [Spr_playagain, Spr_playnext];
	var _sidebutton = [Spr_menu, Spr_upgrades];

	// Clean up gameplay state
	instance_destroy(Obj_fish);
	instance_deactivate_all(true);
	instance_activate_object(Obj_player);
	instance_activate_object(__InputUpdateController);
	instance_activate_object(Obj_debug);

	// Overlay tint
	draw_set_alpha(0.25);
	draw_rectangle_color(_x1, _y1, _x1 + _vw, _y1 + _vh, c_red, c_red, c_red, c_red, false);
	draw_rectangle_color(_x1, _y1, _x1 + _vw, _y1 + _vh, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);

	// Panel + selection button
	draw_sprite_ext(Spr_box, 0, _x1, _y1, 2.5 + 0.08, 1.5 + 0.17, 0, image_blend, 1);
	draw_sprite_ext(Spr_playselection_normal, 0, x + 30, y + 410, 1, 1, 0, c_white, 1);

	// TODO: _button / _sidebutton arrays are defined but never drawn — wire these up
}
//print("execting shit in end event")