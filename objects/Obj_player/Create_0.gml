


do_basics = function(){
	if !instance_exists(Obj_cam){instance_create_depth(x,y,-9999,Obj_cam)};
	if !instance_exists(Obj_mus){instance_create_depth(x,y,0,Obj_mus)};
}

full_restart = function(){
	global.state="running" global.size=0.6; 
	
	x=room_width/2 y=room_height/2 
	xto=room_width/2 yto=room_height/2 
	instance_destroy(Obj_fish)
	audio_stop_all()
	room_restart()
}




do_basics()

sprite=Spr_pwalk;
movex=0;
movey=0;
xto=x;
yto=y;

global.size=0.6;
global.state="running";
global.growth=0.005;

draw_xscale=global.size;
draw_yscale=global.size;
draw_angle=global.size;

alarm[0]=100;

combo_info=[0,0,0,0];

//combo timer, combo eaten, highest combo, eaten total

spd=10;
delay=0.07;
can_spawn=true;

powerup=[false,-1];

_xdir= 0;
_ydir= 0;

left=0;
right=0;
down=0;
up=0;
sprint=0;
sneak=0
sneaking=false

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

sprite_index=sprnormal


//function for making the eating animation
exe_eating = function(){

image_index=0
sprite_index=spreating;
audio_play_sound(choose(Snd_eat1,Snd_eat2,Snd_eat3,Snd_eat4),1,false,random_range(0.5,1.3),0,random_range(0.8,1.2));

}




