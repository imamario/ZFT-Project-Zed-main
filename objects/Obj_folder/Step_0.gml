show_debug_message("x: " + string(x))
show_debug_message("y: " + string(y))
show_debug_message("Timer: " + string(timer))
show_debug_message("State: " + string(state))

//fix this shit{
switch(state){
	case "intro":
	    x = lerp(x, room_width / 2, 0.1);
    y = lerp(y, room_height / 2, 0.1);
    
    spin = 3;
    image_angle=lerp(image_angle,360,0.1)

    // 2. Use point_distance to check if we are "close enough" (within 1 pixel)
    if (point_distance(x, y, room_width / 2, room_height / 2) < 1) {
        // Snap to center so it doesn't jitter
        x = room_width / 2;
        y = room_height / 2;
        
        spin = 0; 
        timer += 0.1; 
        
        if (timer > 1) {
			
            //state = "TProom";
            image_index = 1; // Set your image here
            image_speed = 0; // Stop the animation if 
			if timer>5{				
				room_goto(Rm_menu)
			}
		}
	}
	break;
	
	case "start":
	image_xscale=lerp(image_xscale,3,0.1)
	image_yscale=image_xscale
	x=lerp(x,2047,0.1)
	y=lerp(y,971,0.1)
	if (point_distance(x, y, 2047, 971) < 1){
		if !instance_exists(Obj_Menucam){instance_create_layer(x,y,"Instances",Obj_Menucam)}
	}
	
	break;

	

}


    // 1. Smoothly move toward the center
