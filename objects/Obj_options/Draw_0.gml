draw_menu = function(_text) {
	
}

draw_sprite_ext(Spr_box,0,xdraw,ydraw,xdraw_scale,ydraw_scale,0,c_white,1)

/*
draw_text(mouse_x,mouse_y,"audio")
print("mousex : " + string(mouse_x))
print("mousey : " + string(mouse_y))
*/

if cur_tab[0]!=TABS.NONE {

	switch(cur_tab[0]) {
		
		
	case 0:
	
			draw_options(300, 180,"audio",#00FFFF,2,0)
			draw_options(290, 385,"song: " + string(global.settings.audio[0]),#00FFFF,1.5,1)
			draw_options(240, 575,"sfx: " + string(global.settings.audio[1]),#00FFFF,1.5,2)
	
	break;
	
	case 1:
	
			draw_options(300, 180,"adadaaudio",#00FFFF,2,0)
			draw_options(290, 385,"song: " + string(global.settings.audio[0]),#00FFFF,1.5,1)
			draw_options(240, 575,"sfx: " + string(global.settings.audio[1]),#00FFFF,1.5,2)
	
	break;
		
		
	}
	

	

}