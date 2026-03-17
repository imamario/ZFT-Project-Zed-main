if dangerous==1{
	audio_play_sound(sounds,1,false);
	global.state="dead";
	instance_destroy();	
};