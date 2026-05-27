
do_basics = function(){
	if !instance_exists(Obj_cam){instance_create_depth(x,y,-9999,Obj_cam)};
	if !instance_exists(Obj_mus){instance_create_depth(x,y,0,Obj_mus)};
	if !instance_exists(Obj_debug){instance_create_depth(x,y,0,Obj_debug)};
}

full_restart = function(){
	global.state="running" global.size=0.6; 
	
	x=room_width/2 y=room_height/2 
	xto=room_width/2 yto=room_height/2 
	instance_destroy(Obj_fish)
	audio_stop_all()
	room_restart()
}





xprevious_scale=0
do_basics()
_range=50



sprite=Spr_pwalk;
movex=0;
movey=0;
xto=x;
yto=y;

global.size=0.6;
if array_contains(global.bossrooms,room) {global.size=1.5}

global.state="running";
global.state="paused";
global.growth=0.005;
global.powers=[-1,-1,-1]
global.powerup=0; //on powerup?, type (by default -1 which is none)

draw_xscale=global.size;
draw_yscale=global.size;
draw_angle=global.size;

alarm_set(0,300);

combo_info=[0,0,0,0];
//combo timer, combo eaten, highest combo, eaten total





spd=10;
delay=0.1;
can_spawn=true;
if !FOLLOW_MOUSE { delay=0.08 }

// Define the mouse follow function
follow_MS = function(_debug_enb) {
    var _dist = point_distance(x, y, mouse_x, mouse_y);
    if (_debug_enb) _dist = 0;
    
    if (_dist > _range) {
        var _dir = point_direction(x, y, mouse_x, mouse_y);
        
        movex = lerp(movex, lengthdir_x(spd, _dir), 0.35);
        movey = lerp(movey, lengthdir_y(spd, _dir), 0.35);
        
        draw_angle += angle_difference(_dir, draw_angle) * 0.15;
    }
    else {
        movex = lerp(movex, 0, 0.45);
        movey = lerp(movey, 0, 0.45);
    }
};



_xdir= 0;
_ydir= 0;

left=0;
right=0;
down=0;
up=0;
sprint=0;
sneak=0
sneaking=false

//for out of water
vsp = 0;        // vertical speed
grv = 0.5;      // gravity
vsp_jump = -7;  // jump strength (negative = upward)   

// Initialize the array that will hold our trail data
trail_list = [];

// Trail configuration
trail_starting_alpha = 0.6; // How visible the trail is when it first spawns
trail_fade_speed = 0.05;    // How fast the trail fades out per frame
trail_timer = 0;
trail_interval = 3;         // Drop a ghost every 3 frames (adjust for density)

_alpha = 0
_value = 0
_color=0

//sprites specs
sprnormal = Spr_pwalk
spreating = Spr_peating
sprturning = Spr_pturning
sprtrail = Spr_trailbubble
sprblood = Spr_killplat
sprite_index=sprnormal

//blood splat when killed animation
bloodpos=[x,y]





/*
switch(room) {
	
	case Rm_ZFTR:

		sprnormal = Spr_pwalk
		spreating = Spr_peating
		sprturning = Spr_pturning
		sprtrail = Spr_trailbubble

	break;
	
	case Rm_FeedFreenzy:

		sprnormal = Spr_orcawalk
		spreating = Spr_orcaeating
		sprturning = Spr_orcaeating
		sprtrail = Spr_trailbubble

	break;
	
	case Rm_HungryShark:

		sprnormal = Spr_chris
		spreating = Spr_chriseating
		sprturning = Spr_christurning
		sprtrail = Spr_trailbubble

	break;
	
	
}
*/


vsp = 0;             // Vertical speed
out_water = false
gravity_power = 0.5; // How fast you fall






//function for making the eating animation
exe_eating = function(){

image_index=0
sprite_index=spreating;
audio_play_sound(choose(Snd_eat1,Snd_eat2,Snd_eat3,Snd_eat4),1,false,random_range(0.5,1.3),0,random_range(0.8,1.2));

}




