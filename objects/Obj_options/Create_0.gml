enum TABS {//knowing each tab it should show
	
	NONE = 99,
	INTRO,
	AUDIO,
	GRAPHIC,
	CONTROL
	
}

enum OPTION {//to reference graphics or audio

	MUSIC,
	SFX,
	QUALITY,
	PIXELATION,
	SCREEN_RES_W,
	SCREEN_RES_H

}
menu[0] = [OPTION.MUSIC,OPTION.SFX] // Audio tab // music // sound effects
menu[1] = [OPTION.QUALITY,OPTION.PIXELATION,OPTION.SCREEN_RES_W,OPTION.SCREEN_RES_H]
menu[TABS.NONE] = TABS.NONE

menu[0] = TABS.INTRO

cur_tab = [TABS.NONE,menu[0]]
cur_tab[1] = [menu[cur_tab[0]]]

//tab, option
//ex: Graphics, Quality


xto=room_width/2
yto=room_height+1000

xscaleto=1//2.5
yscaleto=1//1.2

xdraw=xto
ydraw=yto

xdraw_scale=xscaleto
ydraw_scale=yscaleto

draw_menu=[//audio
{
	tittle:"Audio",
	text:"music: ",
	text2:"SFX: "
},
{//Graphics
	tittle:"Graphics",
	text:"Resolution: ",
	text2:"Filter: "
}]

temp_settings = global.settings
saved = false



//draw function to easily draw buttons
draw_options = function(_x,_y,_text,_color,_size,_type=0) {
	
	switch(_type) {
			
	case 0:
		
		draw_text_scribble(_x, _y, "[scaleStack," + string(_size) + "] [" + string(_color) + "]" + string(_text))
		
	break;
	
	case 1:
		
		draw_text_scribble(_x, _y, "[scaleStack," + string(_size) + "] [" + string(_color) + "]" + string(_text))
		
	break;
	
	case 2:
		
		draw_text_scribble(_x, _y, "[scaleStack," + string(_size) + "] [" + string(_color) + "]" + string(_text))
		
	break;
		
		
	
		
	}	
}