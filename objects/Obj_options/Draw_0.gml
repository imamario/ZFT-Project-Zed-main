draw_menu = function(_text) {
	
}

draw_sprite_ext(Spr_box,0,xdraw,ydraw,xdraw_scale,ydraw_scale,0,c_white,1)

/*
draw_text(mouse_x,mouse_y,"audio")
print("mousex : " + string(mouse_x))
print("mousey : " + string(mouse_y))
*/

if menu!=TABS.INTRO && menu!=TABS.NONE {

	//for(var i; i < array_length(draw_menu); i++) {
	//}
	
	switch(menu) {
		
	case TABS.AUDIO:
		
		draw_options(300, 180,"audio",#00FFFF,2,0)
		draw_options(290, 385,"song: ",#00FFFF,1.5,1)
		draw_options(240, 575,"sfx: ",#00FFFF,1.5,2)
	
	break;
		
	
	
	
		
	}

}