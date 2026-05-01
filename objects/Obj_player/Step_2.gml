



image_xscale=1;
image_yscale=1;
image_angle=0;



if (global.size>1.5) && (global.state!="victory") {
	
	global.state="rage";
	
};

if (global.state="rage") {
	
	if (alarm[3]=-1) {alarm_set(3,1500)}
	
};

//IF DEAD
if (global.state="dead") || (global.state="victory") {x=9999 y=-9999 global.size=0 can_spawn=false}