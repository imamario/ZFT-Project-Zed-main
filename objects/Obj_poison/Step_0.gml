
if !instance_exists(Obj_player)exit;

depth=Obj_player.depth+10;
image_xscale=lerp(image_xscale,size,0.07);
image_yscale=lerp(image_yscale,size,0.07);

if point_distance(x, y, Obj_player.x, Obj_player.y)<range {
	move_towards_point(Obj_player.x,y,5)
	//speed=0	
}else{speed=0}


image_angle+=vspd*0.3;
vspd+=0.3;
vspd=clamp(vspd,vspd,10);
y+=vspd;





