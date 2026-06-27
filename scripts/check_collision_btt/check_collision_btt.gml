function check_click_btt(xpos,ypos,x2pos,y2pos) {

	if point_in_rectangle(mouse_x,mouse_y,xpos,ypos,x2pos,y2pos){
		
		//window_set_cursor(cr_handpoint)
		
		if mouse_check_button_pressed(mb_left){
		
			return true
		
		}else{window_set_cursor(cr_default) return false}

	}else{window_set_cursor(cr_default) return false}

}