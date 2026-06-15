draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,anim.rotate,c_white,image_alpha)

switch(room) {
	
	case Lv_tutorial:
	
	if (state = "unawake") {
	
	text[1] += 0.3	
	print(text[1])
	draw_set_alpha(text[1])
	draw_text_scribble(x, y + 100,text[0]);   
	draw_set_alpha(1)
	
	}
	
	if (state = "eat_fish") {
		
	draw_sprite_ext(Spr_enemies1,0,cutfish[0],cutfish[1],0.4,0.4,0,c_white,1)
			
	}
	
	break;

}