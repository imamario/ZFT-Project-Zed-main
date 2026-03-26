if timer>0 {timer-=0.1 anim.play_anim=false}else{anim.play_anim=true}

switch(menu){
	
	case MENUS.NORMAL:
		buttons_change(Spr_playbtt,Spr_settings,Spr_exitbtt)
	break;
	
	case MENUS.MODES:
		buttons_change(Spr_storybtt,Spr_challengesbtt,Spr_backbtt)
	break;

/*
	case MENUS.OPTIONS:
		buttons_change(Spr_storybtt,Spr_challengesbtt,Spr_exitbtt)
	break;	

*/
}
	

