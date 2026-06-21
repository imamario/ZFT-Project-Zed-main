/// @desc HUD UI & MENUS

// ============================================================
// EARLY EXITS
// ============================================================
if (global.cutscene) exit;

if (object_exists(Obj_debug) && Obj_debug.enabled) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(x - 720 + string_length(keyboard_string) * 20, y + 500, "cmd: " + string(keyboard_string));
	exit;
}

// ============================================================
// STATE-BASED TARGET POSITION (currently unused below, kept as-is)
// ============================================================
var _xto = x - 1000;
var _yto = x - 1000; // NOTE: likely a bug, probably should be y - 1000

if (global.state == "dead") {
	_xto = x;
	_yto = y;
}

// ============================================================
// HUD: ONLY DRAWN WHILE RUNNING
// ============================================================
if (global.state == "running") {

	// --- Combo / timer data from player ---
	var _timer       = Obj_player.combo_info[0];
	var _combo       = Obj_player.combo_info[1];
	var _hcombo      = Obj_player.combo_info[2];
	var _totalcombo  = Obj_player.combo_info[3];

	// --- Shared draw settings ---
	var _mainsize  = 0.9;
	var _mainalpha = 1;

	// --- Jaw HUD piece positions ---
	var _jawx1 = x + 990;
	var _jawy1 = y - 540;
	var _jawx2 = _jawx1 - 75;
	var _jawy2 = _jawy1 + 165;

	// ------------------------------------------------------------
	// JAW / COMBO WHEEL SPRITES
	// ------------------------------------------------------------
	draw_sprite_ext(hud_jaw1, 0, _jawx1, _jawy1, _mainsize, _mainsize, image_angle, image_blend, _mainalpha);
	draw_sprite_ext(hud_jaw2, 0, _jawx2, _jawy2, _mainsize, _mainsize, jawdraw, image_blend, _mainalpha);
	draw_sprite_ext(Spr_combowheel, 1, _jawx2, _jawy2, _mainsize, _mainsize, 0, image_blend, _mainalpha);

	// ------------------------------------------------------------
	// TIMER CLOCK
	// ------------------------------------------------------------
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_alarm);

	draw_sprite_ext(Spr_timer, 0, x + 960, y + 500, 0.5, 0.5, 0, c_white, 1);
	draw_text_scribble(x + 875, y + 495, "[#17EDEC] [scaleStack,1.2]00:00");

	draw_set_font(global.font);
	draw_set_alpha(1);

	/* Old combo-count display near jaw (replaced by floating combo text below)
	if (_timer > 0) {
		draw_set_alpha(Obj_player.alarm[1]);
		draw_text_scribble(_jawx1 - 280, _jawy1 + 30, "[scaleStack,1.5]" + string(_combo) + "[/scale]x");
		draw_set_alpha(1);
	} else {
		draw_text_scribble(_jawx1 - 280, _jawy1 + 30, "[scaleStack,1.5]" + string(_hcombo) + "[/scale]x");
	}
	*/

	// ------------------------------------------------------------
	// POWER/SIZE BAR (Spr_bar_pro fill over Spr_psize_new background)
	// ------------------------------------------------------------
	var _max_val = 1.5;
	var _w = sprite_get_width(Spr_bar_pro);
	var _h = sprite_get_height(Spr_bar_pro);

	var _draw_x = x + 425;
	var _draw_y = y - 540;
	var _my_scale = 0.5;

	var _percent = clamp(global.size / _max_val, 0, 1);
	var _fill_h  = _h * _percent;
	var _top_cut = _h - _fill_h;

	// Background
	draw_sprite_ext(Spr_psize_new, 0, _draw_x, _draw_y, _my_scale, _my_scale, 0, c_white, 1);

	// Fill (cropped from the bottom up to match _percent)
	draw_sprite_part_ext(
		Spr_bar_pro, 0,
		0, _top_cut,
		_w, _fill_h,
		_draw_x, _draw_y + (_top_cut * _my_scale), // offset scaled to match xscale/yscale
		_my_scale, _my_scale,
		c_white, 1
	);

	// ------------------------------------------------------------
	// COMBO TEXT (floating, original-game-accurate style)
	// ------------------------------------------------------------
	var _draw_combo = 0;
	_draw_combo = lerp(_draw_combo, jawdraw, 0.01);
	_draw_combo = clamp(_draw_combo, 0, 0.5);

	color_trans = clamp(_combo / 100, 0, 1);

	if (_combo > 2) {
		draw_set_alpha(_draw_combo);

		color = merge_colour(c_white, c_red, color_trans);
		draw_set_colour(color);

		draw_text_scribble(x, y + 350, "[wave][wobble][scaleStack,1.5]combo [/scale]x[scaleStack,1.5]" + string(_combo));
		scribble_anim_wave(10, 5, _combo / 50);

		draw_set_colour(c_white);
		draw_set_alpha(1);
	}
}
