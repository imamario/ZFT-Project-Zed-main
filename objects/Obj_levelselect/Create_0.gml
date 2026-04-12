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


//level related

	//positions
	var _x = 500
	var _y = 288
	var _2x = 1450
	var _2y = 800
	
	//array for the positions
	positions =[ {
	
		//top left
		xto: _x,
		yto: _y

	},
	{
	
		//top right
		xto: _2x,
		yto: _y

	},

	{
	
		//bottom left
		xto: _x,
		yto: _2y

	},

	{
	
		//bottom right
		xto: _2x,
		yto: _2y

	}
	]
	
	//knowing which stage picture it should show
	cur_stage=0




draw_levels = function(image,index,xto,yto) {
	
	draw_sprite_ext(image,index,xto,yto,0.72,0.7,0,c_white,1)//draw the picture
	draw_sprite_ext(Spr_portrait,0,xto,yto,0.69,0.69,0,c_white,1)//draw the portrait
	
}

