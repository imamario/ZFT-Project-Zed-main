if (global.state=="paused") || (instance_exists(Obj_cutplayer))exit;

var _music = global.settings.audio[0]
var _sfx = global.settings.audio[1]



switch(global.level[0]){
	
	case 0:
		
		if (global.level[1] != 4) { play_mus(song[0], true, _music) }
		else { play_mus(boss_song[0], true, _music) }
	
	break;
	
	case 1:
		
		play_mus(song[1], true, 1)
	
	break;
	
}


