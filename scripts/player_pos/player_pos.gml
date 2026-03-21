function player_pos(){

if instance_exists(Obj_player){
	if Obj_player.x<x{return -1}else{return 1}
}else{return -1}
}


