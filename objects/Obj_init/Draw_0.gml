var viewx = view_get_wport(view_camera[0])/2
var viewy = view_get_hport(view_camera[0])/2




switch(text_show[2]){

case 0:

draw_text_scribble(viewx,viewy,"[wave]" + string(text_show[0]))
draw_text_scribble(viewx,viewy+100,"3")

break;


case 1:

draw_text_scribble(viewx,viewy,"[wave]" + string(text_show[0]))
draw_text_scribble(viewx,viewy+100,"2")

break;

case 2:

draw_text_scribble(viewx,viewy,"[wave]" + string(text_show[0]))
draw_text_scribble(viewx,viewy+100,"1")

break;

case 3:

draw_text_scribble(viewx,viewy,"[wave]" + string(text_show[1]))
//draw_text_scribble(viewx,viewy+100,"1")

break;

case 4:

instance_destroy()

break;
	
}
text_show[2]+=0.1