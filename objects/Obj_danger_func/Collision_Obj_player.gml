if dangerous==1{
	audio_play_sound(sounds,1,false,global.settings.audio[1]);
	global.state="dead";
	instance_destroy();	
};