save()


/// menu stuff
enum BTT {// references to buttons
	F=0, 
	A=0,
	B=1,
	C=2
}

enum MENUS { // states for menu variable
	NORMAL=0,
	MODES=1,
	OPTIONS=2
}

menu=MENUS.NORMAL // knowing which menu should show


// buttons
var _x = 1150 
var _y = 50


array_btt=[ //showing buttons
{
	sprite: Spr_playbtt,
	x: _x,
	y: _y
},
{
	sprite: Spr_settings,
	x: _x,
	y: _y
},
{
	sprite: Spr_backbtt,
	x: _x,
	y: _y
}]


array_collision = [
    [1210, 195, 1760, 295], // Button 0
    [1210, 500, 1760, 600], // Button 1
    [1210, 800, 1760, 900]  // Button 2
];

next_menu = function(_array_index, _changeto, _is_action = -1, _current_menu_check = -1) {
	//play click s
	if !audio_is_playing(Snd_click) {
	audio_play_sound(Snd_click,1,false,global.settings.audio[1],0,1)
	}
	//static _sound = 0
	//print(_sound)
	//which button to check
	var a = array_collision[_array_index]
	//check status
	

		
		//if !audio_is_playing(Snd_click) { _sound=1 } else { _sound=0 }

		
		
		if (_current_menu_check == -1 || menu == _current_menu_check) {
		
			//check for collision
			if (point_in_rectangle(mouse_x, mouse_y, a[0], a[1], a[2], a[3])) {
		    
				if (mouse_check_button_pressed(mb_left)) {
					if (_is_action != -1) {
				
						return  _is_action() // execute a function such as game_end for example
				
					} else {
				
						menu = _changeto; // change menu to other
			
					}
				}
	
		//space to add other codes if needed
				}
		}
	
}


/*
next_menu = function(_index, _changeto, _is_action, _current_menu_check = -1) {
    // 1. Get the collision data from your existing array
    var _a = array_collision[_index];
    
    // 2. Only run if we are in the correct menu (optional check)
    if (_current_menu_check == -1 || menu == _current_menu_check) {
        
        // 3. Collision Check (Using GUI coordinates for UI stability)
        if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _a[0], _a[1], _a[2], _a[3])) {
            
            // 4. Click Check
            if (mouse_check_button_pressed(mb_left)) {
                if (_is_action) {
                    _changeto(); // Runs a function like game_end()
                } else {
                    menu = _changeto; // Changes the menu variable
                }
                //return true; // Returns true so you know a click happened
            }
        }
    }
    //return false;
}	
*/

			

array_giver = function(){return array_btt} //give away buttons

buttons_change = function(spr1,spr2,spr3) {
	array_btt[0].sprite=spr1
	array_btt[1].sprite=spr2
	array_btt[2].sprite=spr3
}


anim={
play_anim : false,//if it is 1 then it gonna do the slide to the right(appear), if -1 then slide to the left(return)
a_delay : 0.05, //speed to play the appearing animation
r_delay : 0.03,  //speed to play the return animation
anim_ext : room_width+1500 //an variable to help doing the animation it self
}

wave_delay={ //wave delay for the starting animation
	wave_arise:0,
	wave_return:0
}

timer = 1 //start timer to show buttons


//options for the settings button

settings=[
{//volume
	master: 1,
	music: 1,
	sfx: 1	
},
//graphics
{
	pixel_filter_enabled: true
	
},
//controlls
{
	UP: INPUT_VERB.UP,
	DOWN: INPUT_VERB.DOWN,
	LEFT: INPUT_VERB.LEFT,
	RIGHT: INPUT_VERB.RIGHT,
	
	SPRINT: INPUT_VERB.SPRINT,
	SNEAK: INPUT_VERB.SNEAK,	
	
	ACTION: INPUT_VERB.ACTION,
	ACCEPT: INPUT_VERB.ACCEPT,	
	CANCEL: INPUT_VERB.CANCEL,	
	PAUSE: INPUT_VERB.PAUSE,
	MAP: INPUT_VERB.MAP
}]
