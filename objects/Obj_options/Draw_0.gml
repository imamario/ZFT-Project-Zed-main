draw_sprite_ext(Spr_box,0,box_img.x,box_img.y,box_img.xscale,box_img.yscale,0,c_white,1)


act_buttons.x = lerp(act_buttons.x,1344,0.1)


draw_set_color(c_aqua)
for(var _i = 0; _i < 3; _i++) {
	draw_sprite_ext(Spr_blankbtt,0,act_buttons.x,act_buttons.y+(300*_i),1.489796,1.551724,0,c_white,1)
	
	draw_text_scribble(act_buttons.x+170,act_buttons.y+(300*1)-143,"[scaleStack,0.7]back")
	draw_text_scribble(act_buttons.x+170,act_buttons.y+(300*2)-143,"[scaleStack,0.7]video")
	draw_text_scribble(act_buttons.x+170,act_buttons.y+(300*3)-143,"[scaleStack,0.7]audio")

}
draw_set_color(c_white)
//1344 64