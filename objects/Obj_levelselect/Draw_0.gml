var _x = 500
var _y = 288
var _2x = 1450
var _2y = 800







draw_sprite_ext(Spr_box,0,288,896+anim_y,1.808823,0.2534992,0,c_white,image_alpha) // box behind tittle of stage

draw_set_alpha(img_alpha)
draw_text_scribble(960,972,cur_stage[3])//tittle of stage
draw_set_alpha(1)


for(var a = 0 ; a < 5 ; a++) {draw_levels(Spr_pictures,10,positions[a].xto,positions[a].yto)} //draw locked levels underneath even if levels are unlocked, the ideia is that the unlocked levels will appear on top of these unlocked graphics, pure optimization


// --- NEW LOGIC: How many level pictures should we draw on this screen? ---
var _levels_to_draw = 0;

if (cur_stage[0] < max_stage) {
    _levels_to_draw = 5; // Draw all 5 levels if this is a completed stage
} else if (cur_stage[0] == max_stage) {
    _levels_to_draw = max_level; // Draw only up to max_level if this is the newest stage
}
// -------------------------------------------------------------------------

// Loop using our new variable instead of max_level
for(var i = 0 ; i < _levels_to_draw ; i++) { 
	
    // We don't even need the "if (cur_stage[0] <= max_stage)" check anymore 
    // because _levels_to_draw will be 0 if the stage is locked!
	if cur_stage[0]!=-1 {
		
		draw_levels(Spr_pictures, cur_stage[0], positions[i].xto, positions[i].yto)
		if i = 4 {draw_levels(Spr_pictures, 12, positions[4].xto, positions[4].yto)}
		
	}
		
	else {	
	draw_levels(Spr_pictures, 11, positions[4].xto, positions[4].yto)
	}
	
	
	
}

/*
for(var i = 0 ; i < max_level ; i++) { //i will be max_level


	if (cur_stage[0]<max_stage) || (cur_stage[0]=max_stage)  {
	draw_levels(Spr_pictures,cur_stage[0],positions[i].xto,positions[i].yto)
	}//se if cur_stage[0]>max_stage{draw_levels(Spr_pictures,cur_stage[0],positions[i].xto,positions[i].yto)}

	/*
	switch(cur_stage[0]){
		
		case 0:
		
		if global.save[0]<1 {
			
			if (cur_stage[0]<max_stage) || (cur_stage[0]=max_stage)  {
			draw_levels(Spr_pictures,cur_stage[0],positions[i].xto,positions[i].yto)
			}
		
		}else{draw_levels(Spr_pictures,cur_stage[0],positions[i].xto,positions[i].yto)}
			
		break;
		
		case 1:
		
		if global.save[0]<2 {
			
			if (cur_stage[0]<max_stage) || (cur_stage[0]=max_stage)  {
			draw_levels(Spr_pictures,cur_stage[0],positions[i].xto,positions[i].yto)
			}
		
		}else{draw_levels(Spr_pictures,cur_stage[0],positions[i].xto,positions[i].yto)}
		
		
	}
	
	*/
	
	
	

	//int(["mouse_x: " + string(mouse_x), " mouse_y: " + string(mouse_y)])
	
//



//

