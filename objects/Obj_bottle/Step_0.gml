if !instance_exists(Obj_player)exit;
depth=Obj_player.depth+10;
image_xscale=lerp(image_xscale,size,0.07);
image_yscale=lerp(image_yscale,size,0.07);


image_angle+=movey*0.3;
movey+=0.3;
movey=clamp(movey,movey,20);
y+=movey;

//destroy if outside room
if (y<-100) || (y>-room_height+100) || (x<-100) || (x>room_width+100) { instance_destroy() };