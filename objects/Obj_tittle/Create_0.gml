/// menu stuff
enum BTT { // references to buttons
	A=1,
	B=2,
	C=3
}

enum MENUS { // states for menu variable
	NORMAL=0,
	MODES=1,
	OPTIONS=2
}

menu=MENUS.NORMAL // knowing which menu should show


// buttons
var _x = 1150 
var _y = 50


array_btt=[ //showing buttons
{
	sprite: Spr_playbtt,
	x: _x,
	y: _y
},
{
	sprite: Spr_settings,
	x: _x,
	y: _y
},
{
	sprite: Spr_backbtt,
	x: _x,
	y: _y
}]

array_collision=[ //colision for the buttons
collision_rectangle(1210,195,1760,295,self,false,false),
collision_rectangle(1210,500,1760,600,self,false,false),
collision_rectangle(1210,800,1760,900,self,false,false)
]
			

array_giver = function(){return array_btt} //give away buttons

buttons_change = function(spr1,spr2,spr3) {
	array_btt[0].sprite=spr1
	array_btt[1].sprite=spr2
	array_btt[2].sprite=spr3
}


anim={
play_anim : false,//if it is 1 then it gonna do the slide to the right(appear), if -1 then slide to the left(return)
a_delay : 0.05, //speed to play the appearing animation
r_delay : 0.03,  //speed to play the return animation
anim_ext : room_width+1500 //an variable to help doing the animation it self
}

wave_delay={ //wave delay for the starting animation
	wave_arise:0,
	wave_return:0
}

timer = 1 //start timer to show buttons


//options for the settings button

settings=[
{//volume
	master: 1,
	music: 1,
	sfx: 1	
},
//graphics
{
	pixel_filter_enabled: true
	
},
//controlls
{
	UP: INPUT_VERB.UP,
	DOWN: INPUT_VERB.DOWN,
	LEFT: INPUT_VERB.LEFT,
	RIGHT: INPUT_VERB.RIGHT,
	
	SPRINT: INPUT_VERB.SPRINT,
	SNEAK: INPUT_VERB.SNEAK,	
	
	ACTION: INPUT_VERB.ACTION,
	ACCEPT: INPUT_VERB.ACCEPT,	
	CANCEL: INPUT_VERB.CANCEL,	
	PAUSE: INPUT_VERB.PAUSE,
	MAP: INPUT_VERB.MAP
}]
