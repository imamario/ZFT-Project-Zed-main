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


//checking for clicking in anybuttons
for (var i = 0; i < array_length(array_collision) ; i++){

	//normal mode
	next_menu(BTT.A,MENUS.MODES,-1,MENUS.NORMAL)//play
	next_menu(BTT.B,MENUS.NORMAL,function() { room_goto(Rm_options) },MENUS.NORMAL)//options
	next_menu(BTT.C,MENUS.NORMAL,game_end,MENUS.NORMAL)//exit
	
	//modes mode
	//xt_menu(BTT.A,MENUS.MODES,-1,MENUS.NORMAL)
	next_menu(BTT.A,MENUS.MODES,function() { room_goto(Rm_HungryShark) },MENUS.MODES)
	next_menu(BTT.B,MENUS.MODES,function() { audio_play_sound(choose(Snd_fart2,Snd_fart_reverb),1,false,choose(1,2)) },MENUS.MODES)
	next_menu(BTT.C,MENUS.MODES,room_restart,MENUS.MODES)
	
	
	
	
	
	
	

}