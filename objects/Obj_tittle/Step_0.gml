// --- 1. THE FADE LOGIC QUEUE ---
for(var i = -1; i < 10; i++) {
	print(["InputDeviceIsGamepad: " + string(InputDeviceIsGamepad(i)),"Variable I: " + string(i)])
}


if (starting > 0) {
	starting -= 0.01; // Fade In
}

if (ending > 0) {
	ending += 0.05; // Fade out
	
	if (ending >= 1) {
		// Screen is fully black! Execute the queued action.
		if (target_action != -1) {
			target_action(); 
			target_action = -1; // Reset to avoid looping
		} else {
			menu = target_menu; 
		}
		ending = 0;   // Reset fade out
		starting = 1; // Trigger a fade-in for the new menu/room
	}
}

// --- 2. YOUR MENU & ANIMATION LOGIC ---
if (timer > 0) {
	timer -= 0.1; 
	anim.play_anim = false;
} else {
	anim.play_anim = true;
}

switch(menu) {
	case MENUS.NORMAL:
		buttons_change(Spr_playbtt, Spr_settings, Spr_exitbtt);
	break;
	
	case MENUS.MODES:
		buttons_change(Spr_storybtt, Spr_challengesbtt, Spr_backbtt);
	break;
}
	
if mouse_check_button_pressed(mb_left) {
	// Modes Menu
	next_menu(BTT.A, MENUS.MODES, function() { room_goto(Rm_levelselect) }, MENUS.MODES, 1); // storymode (FADES)
	next_menu(BTT.B, MENUS.MODES, function() { audio_play_sound(choose(Snd_fart2, Snd_fart_reverb), 1, false, choose(1, 2)) }, MENUS.MODES); // challenges
	next_menu(BTT.C, MENUS.MODES, room_restart, MENUS.MODES); // back
	
	// Normal Menu
	next_menu(BTT.A, MENUS.MODES, -1, MENUS.NORMAL); // play
	next_menu(BTT.B, MENUS.NORMAL, function() { room_goto(Rm_options) }, MENUS.NORMAL); // options
	next_menu(BTT.C, MENUS.NORMAL, game_end, MENUS.NORMAL); // exit
}

if keyboard_check_pressed(vk_enter) {
	switch(keyboard_string) {
		default:
			keyboard_string = "";
			audio_play_sound(Snd_xperror, 1, false, 0.1);
		break;
	
		case "forgotten":
			room_goto(Rm_extras);	
		break;
	}
}