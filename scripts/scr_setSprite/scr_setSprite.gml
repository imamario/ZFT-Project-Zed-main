function scr_setSprite() {
	//set sprite and sprite index
	if (jumping)
	{
	    sprite_index = spr_man_jump;
	    image_speed = 0.1;
	}

	if (falling)
	{
	    sprite_index = spr_man_jump;
	    image_index = 2;
	    image_speed = 0;
	}

	if (!jumping && !falling)
	{
	    switch(state)
	    {
	        case "standing":
	            sprite_index = spr_man_stand;
	            image_speed = 0;
	        break;
        
	        case "walking":
	            sprite_index = spr_man_walk;
	            image_speed = 0.35;
	        break;
        
	        case "running":
	            sprite_index = spr_man_run;
	            image_speed = 0.4;
	        break;
        
	        case "ducking":
	            sprite_index = spr_man_duck;
	            image_index = 1;
	        break;
	    }
	}

	switch (dir)
	{
	    case "left":
	        image_xscale = -1;
	    break;
    
	    case "right":
	        image_xscale = 1;
	    break;
	}



}
