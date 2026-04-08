//references for stage type
enum STAGES {
	
	AKWARIUM,
	TOILET,
	PIPES,
	SEWERS,
	RIVER,
	WREAK,
	SACRED,
	OCEAN,
	DOOMSDAYS
	
}

//refenres to level number
enum LEVEL {

	FIRST,
	SECOND,
	THIRD,
	BOSS

}

draw_levels = function(image,index,xto,yto) {
	
	draw_sprite_ext(image,index,xto,yto,0.72,0.7,0,c_white,1)//draw the picture
	draw_sprite_ext(Spr_portrait,0,xto,yto,0.69,0.69,0,c_white,1)//draw the portrait
	
}

