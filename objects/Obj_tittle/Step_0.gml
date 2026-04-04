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
	
if mouse_check_button_pressed(mb_left) {
	
	//modes mode
	next_menu(BTT.A,MENUS.MODES,function() { room_goto(Toiletdoom_normal) },MENUS.MODES)//storymode
	next_menu(BTT.B,MENUS.MODES,function() { audio_play_sound(choose(Snd_fart2,Snd_fart_reverb),1,false,choose(1,2)) },MENUS.MODES)//challenges
	next_menu(BTT.C,MENUS.MODES,room_restart,MENUS.MODES)//back
	
	
	//normal mode
	next_menu(BTT.A,MENUS.MODES,-1,MENUS.NORMAL)//play
	next_menu(BTT.B,MENUS.NORMAL,function() { room_goto(Rm_options) },MENUS.NORMAL)//options
	next_menu(BTT.C,MENUS.NORMAL,game_end,MENUS.NORMAL)//exit
		
}
	
	
	
	
	

