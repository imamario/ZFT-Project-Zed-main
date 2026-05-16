//print("PLACE MEETING SHEEL")

if (curstate==STATE.READY) { curstate=STATE.ATTACKING }

if (STATE.HITPOINT) {
	if dangerous==1{
		audio_play_sound(sounds,1,false);
		global.state="dead";
		instance_destroy();	
	};
};