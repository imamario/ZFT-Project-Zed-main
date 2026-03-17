if room=Sewers_normal{
	global.w_timer=60}


//boss configuration
if instance_exists(Obj_boss) || instance_exists(Obj_boss2){
if room=Sewers_boss{global.psize=1 image_xscale=1}else
{image_xscale=1.5 global.psize=1.5}
}