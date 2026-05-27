// --- 1. PRE-CHECKS ---
if (global.state!="dead") && x!=9999 && y!=-9999 {bloodpos=[x,y]}

if (global.state == "paused")||(global.state == "cutscene") exit;
if (global.state == "victory") {
    x = 9999; y = -9999; global.size = 0; can_spawn = false;
    if (exe_rage()) exe_rage();
    exit;
}

var _debug_enabled = instance_exists(Obj_debug) && Obj_debug.enabled;
if (!_debug_enabled && keyboard_check(ord("R"))) full_restart();

// --- 2. INPUTS ---
left  = InputCheck(INPUT_VERB.LEFT);
right = InputCheck(INPUT_VERB.RIGHT);
down  = InputCheck(INPUT_VERB.DOWN);
up    = InputCheck(INPUT_VERB.UP);
sprint = InputCheck(INPUT_VERB.SPRINT);

if (_debug_enabled) {
    left = 0
	right = 0
	down = 0
	up = 0
	sprint = 0;
}

if (InputPressed(INPUT_VERB.SNEAK)) sneaking = !sneaking;

// --- 3. SPEED CALCULATION ---
if (global.state != "rage") {
    if (!sneaking && sprint)        spd = FOLLOW_MOUSE ? lerp(spd, 30, delay) : 25;
    else if (sneaking && !sprint)   spd = FOLLOW_MOUSE ? lerp(spd, 10, delay) : 3;
    else                            spd = FOLLOW_MOUSE ? lerp(spd, 15, delay) : 10;
} 
else {
    delay = 0.1;
    if (!sneaking && sprint)        spd = 50;
    else if (sneaking && !sprint)   spd = 10;
    else                            spd = 25;
    InputColorSet(c_maroon);
}

// --- 4. MOVEMENT (Velocity) ---
var _input_x = right - left;
var _input_y = down - up;

if (!FOLLOW_MOUSE) {
	
	if instance_exists(Obj_water) {
	
	
		if (Obj_water.y>y) {
			movey += grv;
			if (up) && (place_meeting(x,y,Obj_water.bbox_top)) {
			spd = 0
			left = 0
			right = 0
			down = 0
			movey += vsp_jump
			}
		}else{
			movex = lerp(movex, _input_x * spd, delay);
			movey = lerp(movey, _input_y * spd, delay);
		}
	}else{
	
	movex = lerp(movex, _input_x * spd, delay);
    movey = lerp(movey, _input_y * spd, delay);

	}	
} 
else {//follow mouse version
	
	if instance_exists(Obj_water) {
				
		if Obj_water.y>y{
				movey += grv;
			if (Obj_water.water_colision()) && (Obj_water.y>y) {
		
					spd = 0;
					left = 0;
					right = 0;
					down = 0;
					movey += vsp_jump;
		};
		}else{
// Mouse following
				follow_MS(_debug_enabled)

		}
	}else{	
			follow_MS(_debug_enabled)
	}
}//end of mouse movimentation


// Store direction for visuals
_xdir = sign(_input_x);
_ydir = sign(_input_y);

// --- 5. COLLISIONS ---
var _newx = x + movex;
var _newy = y + movey;

// Horizontal
if (place_meeting(_newx, y, Obj_wall)) {
    var _dx = sign(movex);
    while (!place_meeting(x + _dx, y, Obj_wall)) x += _dx;
    movex = 0;
}


// Vertical
if (place_meeting(x, _newy, Obj_wall)) {
    var _dy = sign(movey);
    while (!place_meeting(x, y + _dy, Obj_wall)) y += _dy;
    movey = 0;
}


// --- 6. VISUALS & TRAIL ---
if (!FOLLOW_MOUSE) {
    if (abs(_input_x) == 1 && sprite_index != spreating) {
        draw_xscale = _input_x * global.size;
        draw_yscale = global.size;
        
        if (draw_xscale != xprevious_scale) {
            sprite_index = sprturning;
            image_index = 0;
        }
    }
    xprevious_scale = draw_xscale;
    
	if instance_exists(Obj_water) {	
		if (Obj_water.y<y) {
			draw_angle = lerp(draw_angle, (draw_xscale > 0 ? -_ydir : _ydir) * 50, delay);
		}else{draw_angle = lerp(draw_angle,movey*2,delay);}
	}else{draw_angle = lerp(draw_angle, (draw_xscale > 0 ? -_ydir : _ydir) * 50, delay);}
		
    // Trail
    if (sprint && (abs(movex) > 1 || abs(movey) > 1)) {
        trail_timer++;
        if (trail_timer >= trail_interval) {
            trail_timer = 0;
            array_push(trail_list, {
                t_x: x, t_y: y,
                t_sprite: sprtrail,
                t_frame: image_index,
                t_xscale: draw_xscale * 1.3,
                t_yscale: draw_yscale * 1.3,
                t_angle: draw_angle,
                t_alpha: trail_starting_alpha
            });
        }
    } else {
        trail_timer = 0;
    }
} 
else {
    // Mouse follow visuals
    if (sprite_index != spreating) {
        var _side = (mouse_x > x) ? global.size : -global.size;
        if (draw_yscale != _side && sprite_index != sprturning) {
            sprite_index = sprturning;
            image_index = 0;
            draw_yscale = _side;
        }
    }
    if (sprite_index == sprturning && image_index >= image_number - 1) {
        sprite_index = sprnormal;
    }
    draw_xscale = global.size;
}

// Fade trails
// Fade trail (Always run)
for (var i = array_length(trail_list) - 1; i >= 0; i--) {
    trail_list[i].t_alpha -= trail_fade_speed;
    if (trail_list[i].t_alpha <= 0) { array_delete(trail_list, i, 1); }
}

// --- 7. GAMEPLAY ---
if (global.state == "running" || global.state == "rage") {
    var _fish = instance_place(x, y, Obj_fish);
    if (_fish != noone) {
        if (_fish.eatable) {
            alarm_set(1, 100);
            combo_info[1]++;
            combo_info[3]++;
            global.size += global.growth;
            exe_eating();
            
            if (random(11) > 10) instance_create_layer(x, y, "Instances", Obj_bottle);
            instance_destroy(_fish);
        } else {
            global.state = "dead";
            audio_play_sound(Snd_jaw, 1, false);
        }
    }

    if (global.state == "rage") {
        if (!exe_rage()) exe_rage();
    } else if (exe_rage()) {
        exe_rage();
    }
}

// Combo
combo_info[0] = alarm[1];
if (combo_info[0] > 0) {
    if (combo_info[1] > combo_info[2]) combo_info[2] = combo_info[1];
} else {
    combo_info[1] = 0;
}
//if keyboard_check_pressed(vk_space) { show_message(["movex: " + string(movex),"movey: " + string(movey)]) }









x += movex;
y += movey;