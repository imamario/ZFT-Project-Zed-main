function audio_snd(val1,val2){
	if instance_exists(Obj_player){
		if global.w_timer=30 && global.deathstate=0 && global.prage=0{
			if !audio_is_playing(val1){
			audio_play_sound(val1,1,true,val2)}
		}else{
			audio_stop_sound(val1)
		}
	}
}
//A

