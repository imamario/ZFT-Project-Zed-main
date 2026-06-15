function print(argument){

return show_debug_message(argument)

}



global.bossrooms = [Lv_akwarium_boss]

function is_boss() {
	
var _bossrooms = global.bossrooms
	
if array_contains(_bossrooms,room) {return true}	else	{return false}
	
}



global.money = 0

global.settings={
	audio : [1, 1], //Music and SFX
	graphic : [1920, 1280, 0, false], //resolution (width and height) antialising and fullscreen
	filter : ["NORMAL","NES"] //secret setting
}






display_reset(0, false);

if (global.settings.graphic[3]) {

	window_enable_borderless_fullscreen(true)
	window_set_fullscreen(true)

}

window_set_cursor(cr_default)

//function to reload the settings in-game unused
function settings_reload(argument0) {

	try
	{
		
		global.settings=argument0
	
	}
	catch(error)
	{
		
		show_message(error)
				
	}
	
	
}



//window_set_fullscreen(true)

//#macro Windows:MOBILE false
//#macro Mobile:MOBILE true
#macro MOBILE false
#macro FOLLOW_MOUSE false


