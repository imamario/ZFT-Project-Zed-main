if !variable_global_exists("size")exit;
//print("PLACE MEETING SHEEL")
if (global.size>0.8) || (room=Lv_akwarium_boss) || (room=Lv_tutorial) { anim(0) exit; }

if (curstate==STATE.READY) { curstate=STATE.ATTACKING }

if (STATE.HITPOINT) {
	if dangerous==1{
		audio_play_sound(sounds,1,false,global.settings.audio[1]);
		global.state="dead";
		instance_destroy();	
	};
};