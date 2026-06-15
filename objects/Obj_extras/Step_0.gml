var _button = {
	
			next: check_click_btt(1555,700,1920,832),
			previous: check_click_btt(1555,950,1888,1020)
			
}


var _move = (-_button.previous +_button.next) 
serial_number+=_move
//if _move!=0{print(serial_number)}
//print(serial_number)
//if _button.next {show_message("BUTTON NEXT!")} //show_message(serial_number)}
//if _button.previous {show_message("BUTTON previous!")}//show_message(serial_number)}
//if check_click_btt(1570,672,1888,832) {show_message("LGMDFMDSMFPFPKM")}


serial_number=clamp(serial_number,0,array_length(concept))