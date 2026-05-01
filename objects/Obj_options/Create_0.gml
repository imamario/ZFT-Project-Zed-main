enum TABS {//knowing each tab it should show
	
	INTRO,
	NONE,
	AUDIO,
	GRAPHIC,
	CONTROL
	
}

enum OPTION {//to reference graphics or audio

	AUDIO,
	GRAPH

}


menu=TABS.INTRO

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