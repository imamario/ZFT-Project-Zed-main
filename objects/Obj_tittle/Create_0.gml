save()

// Fade logic variables
starting = 1;
ending = 0;
target_menu = -1;
target_action = -1;

/// Menu stuff
enum BTT { // references to buttons
	F = 0, 
	A = 0,
	B = 1,
	C = 2
}

enum MENUS { // states for menu variable
	NORMAL = 0,
	MODES = 1,
	OPTIONS = 2
}

menu = MENUS.NORMAL; // knowing which menu should show

// Button placement
var _x = 1150; 
var _y = 50;

array_btt = [ // showing buttons
	{ sprite: Spr_playbtt, x: _x, y: _y },
	{ sprite: Spr_settings, x: _x, y: _y },
	{ sprite: Spr_backbtt, x: _x, y: _y }
];

array_collision = [
    [1210, 195, 1760, 295], // Button 0
    [1210, 500, 1760, 600], // Button 1
    [1210, 800, 1760, 900]  // Button 2
];

// The heart of the transition logic
next_menu = function(_array_index, _changeto, _is_action = -1, _current_menu_check = -1, _fade_out = -1) {
	var a = array_collision[_array_index];
	
	if (_current_menu_check == -1 || menu == _current_menu_check) {
		
		if (point_in_rectangle(mouse_x, mouse_y, a[0], a[1], a[2], a[3])) {
			if (mouse_check_button_pressed(mb_left)) {
				
				// Play click sound
				if !audio_is_playing(Snd_click) {
					audio_play_sound(Snd_click, 1, false, global.settings.audio[1], 0, 1);
				}
				
				if (_fade_out != -1) {
					// START THE FADE OUT - Save the action for later
					ending = 0.01; 
					target_menu = _changeto;
					target_action = _is_action;
				} else {
					// NO FADE - Execute instantly
					if (_is_action != -1) {
						return _is_action(); 
					} else {
						menu = _changeto; 
					}
				}
			}
		}
	}
}

array_giver = function() { return array_btt; } 

buttons_change = function(spr1, spr2, spr3) {
	array_btt[0].sprite = spr1;
	array_btt[1].sprite = spr2;
	array_btt[2].sprite = spr3;
}

anim = {
	play_anim : false, // if 1 slide right(appear), if -1 slide left(return)
	a_delay : 0.05,    // speed to play the appearing animation
	r_delay : 0.03,    // speed to play the return animation
	anim_ext : room_width + 1500 // variable to help doing the animation itself
}

wave_delay = { 
	wave_arise: 0,
	wave_return: 0
}

timer = 1; // start timer to show buttons

settings = [
	{ master: 1, music: 1, sfx: 1 },
	{ pixel_filter_enabled: true },
	{
		UP: INPUT_VERB.UP, DOWN: INPUT_VERB.DOWN, LEFT: INPUT_VERB.LEFT, RIGHT: INPUT_VERB.RIGHT,
		SPRINT: INPUT_VERB.SPRINT, SNEAK: INPUT_VERB.SNEAK, ACTION: INPUT_VERB.ACTION,
		ACCEPT: INPUT_VERB.ACCEPT, CANCEL: INPUT_VERB.CANCEL, PAUSE: INPUT_VERB.PAUSE, MAP: INPUT_VERB.MAP
	}
];