enum DEPTHY {
	
	TOP = -1500,
	BOTTOM = 299

}

song=[
Snd_akwarium,
Snd_toiletdoom,
Snd_pipes
]

uni_time = shader_reset()

switch(room){

	case Lv_akwarium:
		uni_time = shader_get_uniform(Sha_plantanim, "u_time");
	break;
		
		
}
