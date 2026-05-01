

switch(room){
	
	case Lv_Toiletdoom:
		depth=(DEPTHY.BOTTOM)
		draw_sprite_ext(Spr_cell,0,1840,785,1.5,1.45,0,image_blend,1)
	break;
	
	case Lv_akwarium:
		shader_set(Sha_plantanim);
		draw_sprite_ext(Spr_accessorieslvl1,0,0,0,1.702439,1.341333,0,image_blend,1)

		// Use current_time divided by a large number to keep the movement slow
		shader_set_uniform_f(uni_time, current_time / 600);
		depth=(DEPTHY.BOTTOM)
		draw_sprite_ext(Spr_lvl1foreground,0,-32,-160,1.718049,1.448,0,image_blend,1)
		shader_reset();
		
		
		// If your plants are on an Asset Layer, you can draw the whole layer at once:
		
	

	break;
		
		
}