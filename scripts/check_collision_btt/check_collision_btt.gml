function check_click_btt(xpos,ypos,x2pos,y2pos) {

	if point_in_rectangle(mouse_x,mouse_y,xpos,ypos,x2pos,y2pos) && mouse_check_button_pressed(mb_left) {
		
		return true
		
	}else{return false}


}