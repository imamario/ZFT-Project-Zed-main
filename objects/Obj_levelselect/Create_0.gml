

//references for stage type
enum STAGES {
	
	AKWARIUM,
	TOILET,
	PIPES,
	WASTE,
	MUTANT,
	WREAK,
	TEMPLE,
	WATERFALL,
	GUTS,
	DOOMSDAYS,
	LOCKED
	
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
	var _x = 480
	var _y = 224
	var _2x = 1440
	var _2y = 672
	
	//array for the positions
positions =[ 

	{
	
		//top left
		xto: _x,
		yto: _y,
		
		xcol:340,
		ycol:105,
		
		x2col:620,
		y2col:335

	},
	
	{
	
		//top right
		xto: _2x,
		yto: _y,
		
		xcol:1300,
		ycol:105,
		
		x2col:1580,
		y2col:335

	},

	{
	
		//bottom left
		xto: _x,
		yto: _2y,
		
		xcol:340,
		ycol:555,
		
		x2col:620,
		y2col:780

	},

	{
	
		//bottom right
		xto: _2x,
		yto: _2y,
		
		xcol:1300,
		ycol:555,
		
		x2col:1580,
		y2col:780

	},
	
	{
	
		//middle (boss level)
		xto: 960,
		yto: 448,
		
		xcol:800,
		ycol:330,
		
		x2col:1120,
		y2col:560

	}
]
	
	//knowing which stage picture it should show 
	cur_stage=[0,Lv_akwarium,Lv_akwarium,"akwarium"] //stage number(which stage it is, not level), stage room, stage boss room, name of stage
	
	max_stage=global.save[0]
	max_level=global.save[1]
	if max_level=0{max_level=1}
	

image_alpha=1
img_alpha=0
anim_x=0
anim_y=1500

anim_yscale=0

draw_levels = function(image,index,xto,yto) {
	
	draw_sprite_ext(image,index,xto+anim_x,yto+anim_y,0.6533334,0.6211823*anim_yscale,0,c_white,image_alpha)//draw the picture
	draw_sprite_ext(Spr_portrait,0,xto+anim_x,yto+anim_y,0.6030293,0.602751*anim_yscale,0,c_white,image_alpha)//draw the portrait
	
}

