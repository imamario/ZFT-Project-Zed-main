/// @description Pause
instance_deactivate_all( true );
audio_pause_all();
window_set_cursor(cr_arrow)
//instance_activate_object( ... ); //Activate persistant objects like Cameras & Controllers!

screen_alpha_set	= 0.8;


//Reset Button Values * Put this here to reset the button positions so that they tween when you pause *
for( var i = 0; i< bc; i++; ){
	bx[ i ]		= -730;
	by[ i ]		= 160;
	bsca[ i ]	= 0.1;
	bcol[ i ]	= c_aqua;
	balpha[ i ]	= 1;
	bspd[ i ]	= 0;
	bxoff[ i ]	= 100;
	byoff[ i ]	= 0;
	byspd[ i ]	= 0;
}