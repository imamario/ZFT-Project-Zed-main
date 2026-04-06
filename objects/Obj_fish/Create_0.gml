randomise()


u_time_id = shader_get_uniform(Sha_wave, "u_time");
u_amplitude_id = shader_get_uniform(Sha_wave, "u_amplitude");
u_frequency_id = shader_get_uniform(Sha_wave, "u_frequency");
u_speed_id = shader_get_uniform(Sha_wave, "u_speed");

// A timer to make the wave move
time = 0;
despawn=60*5;
eateble=false;

// Set wave properties
amplitude = 0.02;
frequency = 10; //10;
sped = 1.5;

hspd=0;
hspd=random_range(6,10);
OGhspd=hspd

/*
change_sprite = function(){
switch(room) {
	default:
		sprite_index=Spr_enemies2;
	break;

	case Rm_HungryShark:
		sprite_index=Spr_hsenemies
	break;
	
	case Rm_FeedFreenzy:
		sprite_index=Spr_FeedFreenzyenemies
	break;
}
}
change_sprite()
*/
sprite_index=Spr_enemies2
size=choose(0.5,0.5,1,1,1,1.5);
if (global.size<0.98){size=choose(0.5,0.5,0.5,0.5,0.5,1) hspd=random_range(3,5)};

/*size=0.5
if global.size<1{size=choose(0.5,0.5,0.5,1);}else
if global.size>1 && global.size<1.5{choose(0.5,0.5,0.5,1);}else{size=choose(1.5,1)}
*/

//exclude his
//size=1.5

switch(size){
	case 0.5:
	image_index=round(random(4));
	break;
	
	case 1:
	image_index=round(random_range(5,7));
	break;
	
	case 1.5:
	image_index=round(random_range(8,11));
	break;
}



diff=round(random(13));
type=2//choose(1,2,2,2,2,2)//round(random(11));
turn=round(random(120));




image_yscale=size
if x<room_width/2{hspd=hspd size=size}else{hspd=-hspd size=-size}
image_xscale=size


frequency=hspd*2

eatanim=-1



