var _bal = 0

if sign(size)<0 { _bal=-size } else { _bal=size }


if instance_exists(Obj_player){
	
	if global.size<_bal{
	
		if !eatable{draw_sprite_ext(Spr_glow,0,x,y,size/1.5,size/1.5,0,c_white,1);}

	}
	
}
shader_set(Sha_wave);

// Pass the uniform values to the shader
shader_set_uniform_f(u_time_id, time);
shader_set_uniform_f(u_amplitude_id, amplitude);
shader_set_uniform_f(u_frequency_id, frequency);
shader_set_uniform_f(u_speed_id, sped);

// Draw the object's sprite
//aw_self();
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,size,0,c_white,1)

//draw_text(x+20,y,"Xspd" + string(x))

// Reset the shader
shader_reset();

//aw_text(x,y-25,"size: " + string(size))