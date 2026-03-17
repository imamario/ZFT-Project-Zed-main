//with(all){ if (global.paused=true)exit; }
//if (global.paused=true)exit;

// --- 1. Get Input ---
randomise()
//keyboard inputs
var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));
var _enemy_hit = instance_place(x, y, Obj_enemies);
var _sprint = keyboard_check(vk_shift);
// Get the direction of movement (-1, 0, or 1)
var movex_dir = (_right - _left);
var movey_dir = (_down - _up);
if r_poison{
movex_dir = (-_right + _left);
movey_dir = (_down - _up);
}
//controller inputs
/*var _movex_gp=(_right - _left);
var _movey_gp=(_down - _up);
*/
var _orbs = instance_place(x,y,Obj_orbs)
var _old_angle = image_angle;
var _target_pitch = 0;
var _gp=global.gamepad_main;
if (_gp != undefined){
	movex_dir= gamepad_axis_value(_gp, gp_axislh)
	movey_dir= gamepad_axis_value(_gp, gp_axislv)
	_sprint=gamepad_button_check(_gp,gp_face1)
}	
var inc = 1
if global.w_timer<0{inc=0}
real_time.miliseconds+=inc
if real_time.miliseconds==99{real_time.seconds++ real_time.miliseconds=0}
if real_time.seconds==60{real_time.minutes++ real_time.seconds=0}

//fix start with wide size
//if widefix=1{if image_xscale>0{movex_dir=1}else{movex_dir=-1}};
//widefix--

//rooms checks
if instance_exists(Obj_boss) || instance_exists(Obj_boss2){max_spd=10 fric=0.25 accel=1}
//sewer stuff
if place_meeting(x,y,Obj_bubble){b_spd=20}else{b_spd=5}

if can_move{
if room=Sewers_normal{x-=b_spd max_spd=7 if global.deathstate<1{global.w_timer-=0.01}
if global.w_timer<0{x=1500 y=1500}}
}




//toilet of doom boss stuff
if place_meeting(x,y,Obj_bossdmgarea) && room=Akwarium1_Bossroom{boss_atk=1}else{boss_atk=0}
if room=Toiletdoom_bossroom{
	if object_exists(Obj_metalboss){
	if (atkanim<0) && place_meeting(x,y,Obj_metalboss){
		atkanim=1.5 audio_play_sound(
			choose(Snd_hit1,Snd_hit2,Snd_hit3,Snd_hit4,Snd_hit5),3,false,0.5)}}
}

// jumping out of water

if MOBILE{
	if instance_exists(obj_joystick){
	with(obj_joystick){
	movex_dir=telling()._x;
	movey_dir=telling()._y;
	movex_dir=clamp(movex_dir,-1,1);
	movey_dir=clamp(movey_dir,-1,1);
		}
	}else{movey_dir=0 movex_dir=0}
}

/*out_water=function(){if	!instance_exists(Obj_water) {return false}if (y>Obj_water.y){return false}else{return true}};
*/
if out_water(){
	jmpspd+=-grav
	y+=-jmpspd+vsp
	if jmpspd<0{movey_dir=1}else
	{movey_dir=-1}
}else{jmpspd=2};

if keyboard_check_pressed(ord("I")){room_goto(Akwarium1_normal)};
if keyboard_check_pressed(ord("U")){room_goto(Akwarium1_Bossroom)};


if audio_is_playing(Snd_ragedtheme){targetedpsize=999 global.w_timer-=0.01 Obj_pfish.bottle_timer=0 Obj_pfish.bottle_eff=-1 max_spd=30 fric=0 accel=30}
if atkanim=1.5{extra_feed.eated_total++}

if (global.w_timer<0){movex_dir=0 movey_dir=0 image_alpha=0 bottle_timer=0 bottle_eff=-1 draw_set_color(c_white)}
if (global.deathstate>0.5){global.deathstate+=0.1 movex_dir=0 movey_dir=0 bottle_timer=0 bottle_eff=-1}
if global.deathstate=1{image_alpha=0 audio_play_sound(Snd_jaw,10,false) x=1500 y=1500}

atkanim-=0.1
bottle_timer-=0.05
if bottle_timer<0{bottle_timer=0}
//poison effect

//			//BOSS DANGER OBJECT//			//
if instance_exists(Obj_dangerous){
if instance_place(x,y,Obj_dangerous) && instance_place(x,y,Obj_dangerous).dangerous==1{global.deathstate=0.9}
}
image_yscale = global.psize;

// --- 2. Calculate Horizontal Speed (Acceleration / Friction) ---
if global.cutscene{can_move=false}else{can_move=true}
if can_move{
if (movex_dir != 0) {
    // Accelerate
    hsp += movex_dir * accel;
} else {
    // Decelerate (Apply Friction/Drift)
    if (hsp > fric) { hsp -= fric; }
    else if (hsp < -fric) { hsp += fric; }
	else{hsp=0}
}

// --- 3. Calculate Vertical Speed (Acceleration / Friction) ---
if (movey_dir != 0) {
    // Accelerate
    vsp += movey_dir * accel;
} else {
    // Decelerate (Apply Friction/Drift)
    if (vsp > fric) { vsp -= fric; }
    else if (vsp < -fric) { vsp += fric; }
    else { vsp = 0; }
}
		
// --- 4. Clamp Speed to Maximum ---
// This stops you from accelerating forever.
// It also correctly handles diagonal speed!
var current_speed = point_distance(0, 0, hsp, vsp);
if (current_speed > max_spd) {
    hsp = (hsp / current_speed) * max_spd; // Normalize and scale
    vsp = (vsp / current_speed) * max_spd; // Normalize and scale
}
}else{max_spd=0 if image_xscale!=global.psize{image_xscale=global.psize}}

//show_debug_message("moveX_dir: " + string(movex_dir))
//show_debug_message("moveY_dir: " + string(movey_dir))


//colission CODE
if (place_meeting(x + hsp, y, Obj_wall)) {
    // Move to the exact edge of the wall
    while (!place_meeting(x + sign(hsp), y, Obj_wall)) {
        x += sign(hsp);
    }
    hsp = 0;
	
}
x += hsp;

// --- Vertical Collision ---
if (place_meeting(x, y + vsp, Obj_wall)) {
    // Move to the exact edge of the wall
    while (!place_meeting(x, y + sign(vsp), Obj_wall)) {
        y += sign(vsp);
    }
    vsp = 0;
	
}
y += vsp;

// --- 5. Apply Movement ---
//x+=hsp
//y += vsp;

// --- 6. Handle Flipping (Based on INPUT) ---
// We use movex_dir so the fish flips *immediately* when you press a key,
// even if it's still drifting the other way.
if can_move{
if (movex_dir > 0) { // Pressing right
    image_xscale = global.psize;
} else if (movex_dir < 0) { // Pressing left
    image_xscale = -global.psize;
}
}
// --- 7. Handle Angle (Pitching) ---

// 1. Store the angle before we try to change it
/*
if !MOBILE{
if (movey_dir != 0) {
    // Calculate what the new angle SHOULD be
    var pitch_force = (movey_dir * max_spd) / 2.5;
    if (image_xscale == -global.psize) {
        _target_pitch = image_angle + pitch_force;
    } else {
        _target_pitch = image_angle - pitch_force;
    }
} else {
    // Return to zero logic
    if (image_angle > rotationspd) _target_pitch = image_angle - rotationspd;
    else if (image_angle < -rotationspd) _target_pitch = image_angle + rotationspd;
    else _target_pitch = 0;
}
	}else{
		if (movey_dir != 0) { // IF MOBILE
    // Calculate what the new angle SHOULD be
    var pitch_force = (movey_dir * 5) / 2.5;
    if (image_xscale == -global.psize) {
        _target_pitch = image_angle + pitch_force;
    } else {
        _target_pitch = image_angle - pitch_force;
    }
} else {
    // Return to zero logic
    if (image_angle > rotationspd) _target_pitch = image_angle - rotationspd;
    else if (image_angle < -rotationspd) _target_pitch = image_angle + rotationspd;
    else _target_pitch = 0;
}
	}	



// 2. Apply the clamp to our target
_target_pitch = clamp(_target_pitch, -50, 50);

// 3. SAFETY CHECK: Only apply the angle if it doesn't cause a collision
image_angle = _target_pitch; 

if (place_meeting(x, y, Obj_wall)) {
    // If the new angle puts us inside a wall, undo it!
    image_angle = _old_angle;
}
*/
if (atkanim>0){sprite_index=Spr_peating}else
{sprite_index=Spr_pwalk}



//fish eating logic + powerups witch are bottles
/* if instance_exists(_enemy_hit)
{
    if _enemy_hit.image_blend!=c_red
    {
		if place_meeting(x+0.1,y+0.1,Obj_func_enemie){atkanim=1.5 audio_play_sound(
			choose(Snd_eat1,Snd_eat2,Snd_eat3,Snd_eat4),3,false,0.5)}
        targetedpsize-=1
		instance_destroy(_enemy_hit); 
    }else if _enemy_hit.image_blend=c_red && bottle_eff!=6{
		if place_meeting(x+0.1,y+0.1,Obj_func_enemie) && global.deathstate=0{global.deathstate=0.9}		
}}
*/

	
if instance_exists(_enemy_hit)
{
    if _enemy_hit.image_blend != c_red
    {
        // [CHALLENGE LOGIC ADDED HERE]
        if (room == Challenge_room && global.challenge == 0) {
            // Check if the fish we are about to eat is the aqua challenge fish
            if (_enemy_hit.image_blend == c_aqua) {
                with(Obj_nemesis) {
                    freeze = 5; // Trigger the freeze on all nemesis objects
                }
            }
        }
        // Your existing eating logic
            atkanim = 1.5; 
		audio_play_sound(choose(Snd_eat1,Snd_eat2,Snd_eat3,Snd_eat4), 3, false, 0.5)
        targetedpsize -= 1;
        instance_destroy(_enemy_hit); // Now it destroys the fish AFTER checking the challenge
		extra_feed.blood+=1
		if (global.w_timer!=30){extra_feed.eated_combo++}
    } 
    else if _enemy_hit.image_blend == c_red && bottle_eff != 6 
    {
        if place_meeting(x+0.1, y+0.1, Obj_func_enemie) && global.deathstate == 0 {
            global.deathstate = 0.9;
        }		
    }
}

if instance_exists(_orbs){
	if _orbs{
		if (atkanim<0){atkanim = 1.5};
		if atkanim=1.5{audio_play_sound(choose(Snd_eat1,Snd_eat2,Snd_eat3,Snd_eat4), 3, false, 0.5) _orbs.hp--};
	}
}

//RAGE STUFF
extra_feed.blood=clamp(extra_feed.blood,0.75,1)
extra_feed.font=1
if (audio_is_playing(Snd_ragedtheme)) {
    extra_feed.blood -= 0.01;
	

    // --- Handle the "Atlas" Layer ---
    if (layer_exists("Atlas")) {
        var _elements = layer_get_all_elements("Atlas");
        for (var i = 0; i < array_length(_elements); i++) {
            if (layer_get_element_type(_elements[i]) == layerelementtype_sprite) {
                layer_sprite_blend(_elements[i], c_maroon);
            }
        }
    }

    // --- Handle the "Atlas1" Layer ---
    if (layer_exists("Atlas1")) {
        var _elements2 = layer_get_all_elements("Atlas1");
        for (var i = 0; i < array_length(_elements2); i++) {
            if (layer_get_element_type(_elements2[i]) == layerelementtype_sprite) {
                layer_sprite_blend(_elements2[i], c_maroon);
            }
        }
    }

    // --- Handle the "Background" Layer ---
    // Background layers usually only have ONE element, so we get that specific ID.
    var _bg_layer_id = layer_get_id("Background");
    var _bg_element_id = layer_background_get_id(_bg_layer_id);
    if (_bg_element_id != -1) {
        layer_background_blend(_bg_element_id, c_maroon);
    }
}








//execute the powerups/bottles spawning
if bottle_eff=-1{
if b_spawn=1 {instance_create_layer(x,y,layer,Obj_bottle) b_spawn=0}
if atkanim=1
{b_spawn=choose(0,0,0,1)}}

//grow in size when fish are eaten enough
if targetedpsize<1 && global.prage=0{global.psize+=0.05 widefix=1 targetedpsize=settargeted}

//eat obj_bottle
if instance_exists(Obj_bottle){
	if instance_place(x,y,Obj_bottle) && (instance_place(x,y,Obj_bottle).vul<0){
		bottle_eff=instance_place(x,y,Obj_bottle).image_index
		atkanim=1.5 
		audio_play_sound(choose(Snd_eat1,Snd_eat2,Snd_eat3,Snd_eat4),3,false,0.5)
		instance_destroy(instance_place(x,y,Obj_bottle))}}

//execute effects
if bottle_timer=0.1{bottle_eff=-1} // CHANGE THIS
if bottle_eff!=-1 && bottle_timer=0{bottle_timer=60}
if bottle_eff=0{x+=r_poison y+=r_poison2}
if bottle_eff=4{r_attract=1}
if bottle_eff=8{if _sprint{max_spd=10 fric=0.2}else{max_spd=6.5 fric=0.1}}else{max_spd=6.5 fric=0.1}
if bottle_eff=2{max_spd/=2 y+=1.5}
if bottle_eff=6{sprite_index=Spr_armor}
else if bottle_eff=-1 && sprite_index=Spr_armor{sprite_index=Spr_pwalk}



//misc code (do not change)




	
	// --- Search for this section in your Obj_pfish code ---

	
	
	
	
	
	
	
