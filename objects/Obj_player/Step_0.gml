// --- 1. PRE-CHECKS ---
if (global.state == "victory") {
    x = 9999; y = -9999; global.size = 0; can_spawn = false;
    if (exe_rage()) { exe_rage(); }
    exit;
}

var _debug_enabled = false;
if (instance_exists(Obj_debug)) { _debug_enabled = Obj_debug.enabled; }
if (!_debug_enabled && keyboard_check(ord("R"))) { full_restart(); }

randomise();

// --- 2. INPUTS ---
left = InputCheck(INPUT_VERB.LEFT);
right = InputCheck(INPUT_VERB.RIGHT);
down = InputCheck(INPUT_VERB.DOWN);
up = InputCheck(INPUT_VERB.UP);
sprint = InputCheck(INPUT_VERB.SPRINT);
sneak_pressed = InputPressed(INPUT_VERB.SNEAK);

if (_debug_enabled) {
    left = 0; right = 0; down = 0; up = 0; sprint = 0; sneak_pressed = 0;
}
if (sneak_pressed) { sneaking = !sneaking; }

// --- 3. SPEED & MOVEMENT CALCULATION ---
if (global.state != "rage") { 
    if (!sneaking && sprint) { spd = (FOLLOW_MOUSE) ? lerp(spd, 30, delay) : 25; }
    else if (sneaking && !sprint) { spd = (FOLLOW_MOUSE) ? lerp(spd, 10, delay) : 3; }
    else { spd = (FOLLOW_MOUSE) ? lerp(spd, 15, delay) : 10; }
} else {
    delay = 0.1;
    if (!sneaking && sprint) { spd = 50; }
    else if (sneaking && !sprint) { spd = 10; }
    else { spd = 25; }
}

// Store direction globally (no 'var') so Draw event sees it
_xdir = right - left;
_ydir = down - up;

if (!FOLLOW_MOUSE) {
    var _mult = (powerup[1] != 0) ? 1 : -1;
    xto += _xdir * spd * _mult;
    yto += _ydir * spd * _mult;
    movex = lerp(x, xto, delay);
    movey = lerp(y, yto, delay);
} else {
    xto = mouse_x; yto = mouse_y;
    var _dist = point_distance(x, y, mouse_x, mouse_y);
    if (_debug_enabled) _dist = 0;

    if (_dist > _range) {
        var _lx = lerp(x, xto, delay);
        var _ly = lerp(y, yto, delay);
        var _cur_spd = point_distance(x, y, _lx, _ly);
        if (_cur_spd > spd) {
            var _ratio = spd / _cur_spd;
            movex = lerp(x, xto, delay * _ratio);
            movey = lerp(y, yto, delay * _ratio);
        } else {
            movex = _lx; movey = _ly;
        }
        var _target_ang = point_direction(x, y, mouse_x, mouse_y);
        draw_angle += angle_difference(_target_ang, draw_angle) * 0.12;
    } else {
        movex = x; movey = y;
    }
}

// --- 4. COLLISIONS & POSITION ---
if (place_meeting(movex, y, Obj_wall)) {
    var _dx = sign(movex - x);
    while (!place_meeting(x + _dx, y, Obj_wall)) { x += _dx; }
    movex = x; xto = x;
}
x = movex;

if (place_meeting(x, movey, Obj_wall)) {
    var _dy = sign(movey - y);
    while (!place_meeting(x, y + _dy, Obj_wall)) { y += _dy; }
    movey = y; yto = y;
}
y = movey;

// --- 5. VISUALS & TRAIL ---
if (!FOLLOW_MOUSE) {
    if (abs(_xdir) == 1 && sprite_index != spreating) {
        draw_xscale = _xdir * global.size;
        draw_yscale = global.size;
        if (draw_xscale != xprevious_scale) { // Check if flipped
            sprite_index = sprturning; image_index = 0;
        }
    }
    xprevious_scale = draw_xscale; // Helper variable to track flips
    draw_angle = lerp(draw_angle, (draw_xscale > 0 ? -_ydir : _ydir) * 50, delay);

    // TRAIL LOGIC (Capture state after movement is applied)
    if (sprint && (x != xprevious || y != yprevious)) {
        trail_timer++;
        if (trail_timer >= trail_interval) {
            trail_timer = 0;
            array_push(trail_list, {
                t_x: x, t_y: y, t_sprite: sprtrail, t_frame: image_index,
                t_xscale: draw_xscale * 1.3, t_yscale: draw_yscale * 1.3,
                t_angle: draw_angle, t_alpha: trail_starting_alpha
            });
        }
    } else { trail_timer = 0; }
} else {
    // Mouse Flip Logic
    if (sprite_index != spreating) {
        var _side = (mouse_x > x) ? global.size : -global.size;
        if (draw_yscale != _side && sprite_index != sprturning) {
            sprite_index = sprturning; image_index = 0; draw_yscale = _side; 
        }
    }
    if (sprite_index == sprturning && image_index >= image_number - 1) {
        sprite_index = sprnormal;
    }
    draw_xscale = global.size;
}

// Fade trail (Always run)
for (var i = array_length(trail_list) - 1; i >= 0; i--) {
    trail_list[i].t_alpha -= trail_fade_speed;
    if (trail_list[i].t_alpha <= 0) { array_delete(trail_list, i, 1); }
}

// --- 6. GAMEPLAY (EATING/POWERUPS) ---
// (Keep your eating and combo logic here as it was)
// ... [Eating Logic] ...

// --- EATING ENEMIES --- //
if (global.state == "running" || global.state == "rage") {
    var _fish = instance_place(x, y, Obj_fish);
    if (_fish) {
        if (_fish.eatable) {
            alarm_set(1, 100);
            combo_info[1]++;
            combo_info[3]++;
            global.size += global.growth;
            exe_eating();
            
            if (random(11) > 10) { 
                instance_create_layer(x, y, "Instances", Obj_bottle); 
            }
            instance_destroy(_fish);
        } else {
            global.state = "dead"; 
            audio_play_sound(Snd_jaw, 1, false);
        }
    }
    
    if (global.state == "rage") { 
        if (!exe_rage()) { exe_rage(); } 
    } else { 
        if (exe_rage()) { exe_rage(); } 
    }
}

// --- COMBO --- //
combo_info[0] = alarm[1];
if (combo_info[0] > 0) {
    if (combo_info[1] > combo_info[2]) { 
        combo_info[2] = combo_info[1]; 
    }
} else {
    combo_info[1] = 0;
}

// --- POWERUPS --- //
var _bottle = instance_place(x, y, Obj_bottle);
if (_bottle) {
    if (_bottle.iv_frames < 900) {
        alarm_set(2, 2500);
        exe_eating();
        powerup[0] = true;
        powerup[1] = _bottle.image_index;
        instance_destroy(_bottle);
    }
}

if (alarm[2] < 1) {
    alarm_set(2, -1);
    powerup[0] = false;
    powerup[1] = -1;
} else {
    if (powerup[1] == 2) {
        sneaking = true;
    }
    if (powerup[1] == 3) {
        with (Obj_fish) { size = 0.5; }
    }
    if (powerup[1] == 4) {
        with (Obj_fish) {
            // Evaluated correctly so the fish check distance to the PLAYER, not to the first fish created.
            if (point_distance(other.x, other.y, x, y) < 10) { 
                x = lerp(x, other.x, 0.1); 
                y = lerp(y, other.y, 0.1);
            }
        }
    }
}

// --- APPLY MOVEMENT --- //
x = movex;
y = movey;