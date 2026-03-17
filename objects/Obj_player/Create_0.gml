if !instance_exists(Obj_cam){instance_create_depth(x,y,-9999,Obj_cam)};
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