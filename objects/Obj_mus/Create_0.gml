enum DEPTHY {
	
	TOP = -1500,
	BOTTOM = 299

}

song=[
Snd_akwarium,
Snd_toiletdoom,
Snd_pipes
]

boss_song = [Snd_Boss1,Snd_boss2]

uni_time = shader_reset()

switch(global.level[0]){

	case 0:
		uni_time = shader_get_uniform(Sha_plantanim, "u_time");
	break;
		
		
}
