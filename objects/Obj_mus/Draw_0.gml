

switch(global.level[0]){
	
	case 0:
		if global.level[1] == 4 && instance_exists(Obj_scientist) {
		draw_sprite_ext(Spr_scientist,0,Obj_scientist.pos.x,Obj_scientist.pos.y,Obj_scientist.image_xscale,Obj_scientist.image_yscale,0,c_white,1)
		}
		
		draw_sprite_ext(Spr_accessorieslvl1,0,0,0,1,1,0,image_blend,1)
		shader_set(Sha_plantanim);
		//draw_sprite_ext(Spr_accessorieslvl1,0,0,0,1.702439,1.341333,0,image_blend,1)
		
		// Use current_time divided by a large number to keep the movement slow
		shader_set_uniform_f(uni_time, current_time / 600);
		depth=(DEPTHY.BOTTOM)
		//draw_sprite_ext(Spr_lvl1foreground,0,-32,-160,1.718049,1.448,0,image_blend,1)
		draw_sprite_ext(Spr_lvl1foreground,0,-100,0,1.1,1,0,image_blend,1)
		
		
		
		
		shader_reset();
	break;
	
	case 1:
		depth=(DEPTHY.BOTTOM)
		draw_sprite_ext(Spr_cell,0,1840,785,1.5,1.45,0,image_blend,1)
		draw_sprite_ext(Spr_cell,0,672,1152,1.027658,1.318091,0,image_blend,1)
	break;
	

		
		
}