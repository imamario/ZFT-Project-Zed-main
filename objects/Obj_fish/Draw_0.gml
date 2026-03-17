if instance_exists(Obj_player){
if global.size<size{
draw_sprite_ext(Spr_glow,0,x,y,image_xscale/1.5,image_yscale/1.5,0,c_white,1);
	}
}
shader_set(Sha_wave);

// Pass the uniform values to the shader
shader_set_uniform_f(u_time_id, time);
shader_set_uniform_f(u_amplitude_id, amplitude);
shader_set_uniform_f(u_frequency_id, frequency);
shader_set_uniform_f(u_speed_id, sped);

// Draw the object's sprite
draw_self();
//draw_text(x+20,y,"Xspd" + string(x))

// Reset the shader
shader_reset();