// --- Old Variables ---
instance_create_layer(x,y,layer,Obj_songmng)
if !instance_exists(Obj_cam){
instance_create_layer(x, y, layer, Obj_cam)};
if !instance_exists(Obj_input){
instance_create_layer(x, y, layer, Obj_input)};

instance_create_depth(x, y, self.depth-1, Obj_bottleaddons);
if !instance_exists(Obj_mouse){instance_create_layer(x,y,"mouse",Obj_mouse)}
instance_create_layer(x,y,"mouse",Obj_pause);
/*
if MOBILE{
	instance_create_layer(x,y,"hud",obj_joystick)
}
*/
movex_dir = 0;
movey_dir = 0;
extra_feed={
	
	blood: 0,
	font: 1,
	time_inc: 5,
	eated_total: 0,
	eated_combo: 0
	
}

real_time={
	miliseconds: 0,
	seconds: 0,
	minutes: 0,
	hours: 0
}

raged=false


global.psize = 0.61 //0.61
global.prage=0

rotationspd = 5;
image_xscale = global.psize;
image_yscale = global.psize;
global.deathstate=0
global.w_timer=30//30
settargeted=5
targetedpsize=settargeted
b_spawn=0
total_fish=0
widefix=1
boss_atk=0
can_move=true

bottle_eff=-1
bottle_timer=0
brt=60


//effects
r_poison=0
r_poison2=0
r_attract=0

b_spd=0


// --- New Movement Variables ---
hsp = 0; // Current horizontal speed
vsp = 0; // Current vertical speed
atkanim=0

max_spd = 6.5;     // This was your old 'spd'
accel = 0.5;     // How fast you speed up
fric = 0.1;  // How fast you slow down (drift). Make this smaller than accel.

//out_water=0
jmpspd = 0; //change on step event
grav = 0.1;
// We no longer need movex or movey in the Create Event
