
#region Draw Buttons & Background
//////////////////////////////////////////////////////////////////////////////




if ( screen_alpha > 0 ){
draw_set_color( c_black );
draw_set_alpha( screen_alpha );
draw_rectangle( 0,0, gwidth, gheight, false );
draw_set_alpha( 1 );
draw_set_color( c_white );
draw_set_halign( fa_left );
draw_set_valign( fa_center );
draw_set_font( global.font ); //If you're using your own fonts, set them here.
draw_set_color( c_aqua );
draw_text_scribble(cx-550+font_xtest,cy-280+font_ytest,"[wave][scale,1.5][game pause[/wave]")
scribble_anim_wave(3,3,0.1)
draw_set_color( c_white );

//draw_text_scribble(Obj_cam.x,Obj_cam.y-100,"[wave][scale,2]Game paused[/wave]")
//draw_text_scribble(Obj_cam.x,Obj_cam.y,"[scale,1]take your time")

	// Draw Buttons
	for( var i=0; i<bc; i++; ){
	draw_text_transformed_color( bx[i]-700,by[i]+160,bstring[i],bsca[i],bsca[i],0,bcol[i],bcol[i],bcol[i],bcol[i],balpha[i] * screen_alpha );
	
	}
}

//////////////////////////////////////////////////////////////////////////////
#endregion