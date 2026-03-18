enum BUTTS{
	
	//first screen
	PLAY = 0,
	OPTIONS = 1,
	EXIT = 2,
	
	
	//second screen on play (tabs)
	STORYMODE = 0,
	CHALLENGES = 1,
	CONTRAPTIONS = 2,
	
	//Options second screen (tabs)
	SOUNDS = 0,
	GRAPHICS = 1,
	CONTROLS = 2
}



settings=[
{//volume
	master: 1,
	music: 1,
	sfx: 1	
},
//graphics
{
	enabled: true,
	pixel_filter: gpu_set_texfilter(enabled)
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

menu=[0,0]

